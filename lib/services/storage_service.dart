import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _usersKey = 'users';
  static const String _messagesKey = 'messages';
  static const String _faqsKey = 'faqs';
  static const String _forumPostsKey = 'forum_posts';
  static const String _forumResponsesKey = 'forum_responses';
  static const String _currentUserKey = 'current_user';

  // Users
  Future<List<Map<String, dynamic>>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString(_usersKey);
    if (usersJson == null) {
      return [];
    }
    return List<Map<String, dynamic>>.from(json.decode(usersJson));
  }

  Future<void> saveUsers(List<Map<String, dynamic>> users) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usersKey, json.encode(users));
  }

  // Messages
  Future<List<Map<String, dynamic>>> getMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final messagesJson = prefs.getString(_messagesKey);
    if (messagesJson == null) {
      return [];
    }
    return List<Map<String, dynamic>>.from(json.decode(messagesJson));
  }

  Future<void> saveMessages(List<Map<String, dynamic>> messages) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_messagesKey, json.encode(messages));
  }

  // FAQs
  Future<List<Map<String, dynamic>>> getFAQs() async {
    final prefs = await SharedPreferences.getInstance();
    final faqsJson = prefs.getString(_faqsKey);
    if (faqsJson == null) {
      return [];
    }
    return List<Map<String, dynamic>>.from(json.decode(faqsJson));
  }

  Future<void> saveFAQs(List<Map<String, dynamic>> faqs) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_faqsKey, json.encode(faqs));
  }

  // Forum Posts
  Future<List<Map<String, dynamic>>> getForumPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final postsJson = prefs.getString(_forumPostsKey);
    if (postsJson == null) {
      return [];
    }
    return List<Map<String, dynamic>>.from(json.decode(postsJson));
  }

  Future<void> saveForumPosts(List<Map<String, dynamic>> posts) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_forumPostsKey, json.encode(posts));
  }

  // Forum Responses
  Future<List<Map<String, dynamic>>> getForumResponses() async {
    final prefs = await SharedPreferences.getInstance();
    final responsesJson = prefs.getString(_forumResponsesKey);
    if (responsesJson == null) {
      return [];
    }
    return List<Map<String, dynamic>>.from(json.decode(responsesJson));
  }

  Future<void> saveForumResponses(List<Map<String, dynamic>> responses) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_forumResponsesKey, json.encode(responses));
  }

  // Current User
  Future<String?> getCurrentUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currentUserKey);
  }

  Future<void> setCurrentUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentUserKey, userId);
  }

  Future<void> clearCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserKey);
  }
}

