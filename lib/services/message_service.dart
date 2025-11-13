import '../models/message.dart';
import '../models/user.dart';
import 'storage_service.dart';

class MessageService {
  final StorageService _storage = StorageService();

  Future<List<Message>> getMessagesForUser(String userId) async {
    final messagesData = await _storage.getMessages();
    final messages = messagesData
        .map((data) => Message.fromJson(data))
        .where((message) => 
            message.senderId == userId || message.receiverId == userId)
        .toList();
    
    messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return messages;
  }

  Future<List<Message>> getConversation(String userId1, String userId2) async {
    final messagesData = await _storage.getMessages();
    final messages = messagesData
        .map((data) => Message.fromJson(data))
        .where((message) => 
            (message.senderId == userId1 && message.receiverId == userId2) ||
            (message.senderId == userId2 && message.receiverId == userId1))
        .toList();
    
    messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return messages;
  }

  Future<List<User>> getConversationPartners(String userId) async {
    final messagesData = await _storage.getMessages();
    final usersData = await _storage.getUsers();
    final partnerIds = <String>{};
    
    for (var messageData in messagesData) {
      final message = Message.fromJson(messageData);
      if (message.senderId == userId) {
        partnerIds.add(message.receiverId);
      } else if (message.receiverId == userId) {
        partnerIds.add(message.senderId);
      }
    }
    
    final partners = <User>[];
    for (var userData in usersData) {
      if (partnerIds.contains(userData['id'])) {
        partners.add(User.fromJson(userData));
      }
    }
    
    return partners;
  }

  Future<Message> sendMessage(
    String senderId,
    String receiverId,
    String content,
  ) async {
    final messagesData = await _storage.getMessages();
    
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: senderId,
      receiverId: receiverId,
      content: content,
      timestamp: DateTime.now(),
    );
    
    messagesData.add(newMessage.toJson());
    await _storage.saveMessages(messagesData);
    
    return newMessage;
  }

  Future<void> markAsRead(String messageId) async {
    final messagesData = await _storage.getMessages();
    final index = messagesData.indexWhere((m) => m['id'] == messageId);
    if (index != -1) {
      messagesData[index]['isRead'] = true;
      await _storage.saveMessages(messagesData);
    }
  }

  Future<int> getUnreadCount(String userId) async {
    final messagesData = await _storage.getMessages();
    return messagesData
        .where((m) => 
            m['receiverId'] == userId && (m['isRead'] == false || m['isRead'] == null))
        .length;
  }
}

