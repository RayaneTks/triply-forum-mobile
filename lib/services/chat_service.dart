import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/chat_channel.dart';
import '../models/chat_message.dart';

class ChatService {
  static const String _channelsKey = 'chat_channels';
  static const String _chatMessagesKey = 'chat_messages';

  // Channels
  Future<List<ChatChannel>> getAllChannels() async {
    final prefs = await SharedPreferences.getInstance();
    final channelsJson = prefs.getString(_channelsKey);
    if (channelsJson == null) {
      return [];
    }
    final List<dynamic> channelsData = json.decode(channelsJson);
    return channelsData.map((data) => ChatChannel.fromJson(data)).toList();
  }

  Future<List<ChatChannel>> getChannelsByCategory(String category) async {
    final allChannels = await getAllChannels();
    return allChannels.where((channel) => channel.category == category).toList();
  }

  Future<ChatChannel?> getChannelById(String channelId) async {
    final channels = await getAllChannels();
    try {
      return channels.firstWhere((channel) => channel.id == channelId);
    } catch (e) {
      return null;
    }
  }

  Future<ChatChannel> createChannel({
    required String name,
    required String description,
    required String category,
  }) async {
    final channels = await getAllChannels();
    final newChannel = ChatChannel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      category: category,
      createdAt: DateTime.now(),
    );
    
    channels.add(newChannel);
    await _saveChannels(channels);
    
    return newChannel;
  }

  Future<void> _saveChannels(List<ChatChannel> channels) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _channelsKey,
      json.encode(channels.map((c) => c.toJson()).toList()),
    );
  }

  Future<void> incrementMemberCount(String channelId) async {
    final channels = await getAllChannels();
    final index = channels.indexWhere((c) => c.id == channelId);
    if (index != -1) {
      channels[index] = ChatChannel(
        id: channels[index].id,
        name: channels[index].name,
        description: channels[index].description,
        category: channels[index].category,
        memberCount: channels[index].memberCount + 1,
        createdAt: channels[index].createdAt,
        icon: channels[index].icon,
      );
      await _saveChannels(channels);
    }
  }

  // Messages
  Future<List<ChatMessage>> getMessagesForChannel(String channelId) async {
    final prefs = await SharedPreferences.getInstance();
    final messagesJson = prefs.getString(_chatMessagesKey);
    if (messagesJson == null) {
      return [];
    }
    final List<dynamic> messagesData = json.decode(messagesJson);
    final messages = messagesData
        .map((data) => ChatMessage.fromJson(data))
        .where((message) => message.channelId == channelId)
        .toList();
    
    messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return messages;
  }

  Future<ChatMessage> sendMessage({
    required String channelId,
    required String senderId,
    required String senderName,
    required String content,
    String? replyToId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final messagesJson = prefs.getString(_chatMessagesKey);
    List<dynamic> messagesData = messagesJson != null
        ? json.decode(messagesJson)
        : [];
    
    final newMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      channelId: channelId,
      senderId: senderId,
      senderName: senderName,
      content: content,
      timestamp: DateTime.now(),
      replyToId: replyToId,
    );
    
    messagesData.add(newMessage.toJson());
    await prefs.setString(_chatMessagesKey, json.encode(messagesData));
    
    return newMessage;
  }

  Future<void> initializeDefaultChannels() async {
    final existingChannels = await getAllChannels();
    if (existingChannels.isNotEmpty) return;
    
    final defaultChannels = [
      ChatChannel(
        id: '1',
        name: 'Général',
        description: 'Discussion générale sur les voyages',
        category: 'Général',
        memberCount: 42,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        icon: 'forum',
      ),
      ChatChannel(
        id: '2',
        name: 'Destinations',
        description: 'Partagez vos destinations favorites',
        category: 'Destinations',
        memberCount: 28,
        createdAt: DateTime.now().subtract(const Duration(days: 25)),
        icon: 'flight',
      ),
      ChatChannel(
        id: '3',
        name: 'Restaurants & Food',
        description: 'Découvrez les meilleures adresses culinaires',
        category: 'Restaurants',
        memberCount: 35,
        createdAt: DateTime.now().subtract(const Duration(days: 20)),
        icon: 'restaurant',
      ),
      ChatChannel(
        id: '4',
        name: 'Activités & Excursions',
        description: 'Activités et expériences à ne pas manquer',
        category: 'Activités',
        memberCount: 31,
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        icon: 'sports_soccer',
      ),
      ChatChannel(
        id: '5',
        name: 'Bon plans',
        description: 'Partagez vos bons plans et promotions',
        category: 'Bon plans',
        memberCount: 67,
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        icon: 'local_offer',
      ),
      ChatChannel(
        id: '6',
        name: 'Visas & Formalités',
        description: 'Conseils sur les visas et documents',
        category: 'Visas',
        memberCount: 19,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        icon: 'description',
      ),
    ];
    
    await _saveChannels(defaultChannels);
  }
}

