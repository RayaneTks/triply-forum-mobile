import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class SharedJsonService {
  static SharedJsonService? _instance;
  static SharedJsonService get instance {
    _instance ??= SharedJsonService._();
    return _instance!;
  }

  SharedJsonService._();

  static const String _jsonFileName = 'shared_data.json';
  File? _jsonFile;
  Map<String, dynamic> _data = {};
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    
    try {
      final directory = await getApplicationDocumentsDirectory();
      _jsonFile = File('${directory.path}/$_jsonFileName');
      
      if (await _jsonFile!.exists()) {
        final content = await _jsonFile!.readAsString();
        _data = json.decode(content) as Map<String, dynamic>;
      } else {
        _data = _getDefaultData();
        await _saveToFile();
      }
      _initialized = true;
    } catch (e) {
      if (kDebugMode) {
        print('Erreur initialisation JSON: $e');
      }
      _data = _getDefaultData();
      _initialized = true;
    }
  }

  Map<String, dynamic> _getDefaultData() {
    return {
      'users': [],
      'messages': [],
      'faqs': [],
      'forum_posts': [],
      'forum_responses': [],
      'chat_channels': [],
      'chat_messages': [],
      'lastUpdate': DateTime.now().toIso8601String(),
    };
  }

  Future<void> _saveToFile() async {
    try {
      if (_jsonFile != null) {
        _data['lastUpdate'] = DateTime.now().toIso8601String();
        await _jsonFile!.writeAsString(json.encode(_data));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erreur sauvegarde JSON: $e');
      }
    }
  }

  Future<Map<String, dynamic>> getData() async {
    await initialize();
    return Map<String, dynamic>.from(_data);
  }

  Future<List<dynamic>> getList(String key) async {
    await initialize();
    final data = _data[key];
    if (data is List) {
      return List<dynamic>.from(data);
    }
    return [];
  }

  Future<void> setList(String key, List<dynamic> value) async {
    await initialize();
    _data[key] = value;
    await _saveToFile();
  }

  Future<void> addToList(String key, Map<String, dynamic> item) async {
    await initialize();
    if (_data[key] == null) {
      _data[key] = [];
    }
    (_data[key] as List).add(item);
    await _saveToFile();
  }

  Future<void> updateInList(String key, String id, Map<String, dynamic> updates) async {
    await initialize();
    if (_data[key] == null) return;
    
    final list = _data[key] as List;
    final index = list.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      list[index] = {...list[index] as Map, ...updates};
      await _saveToFile();
    }
  }

  Future<void> removeFromList(String key, String id) async {
    await initialize();
    if (_data[key] == null) return;
    
    final list = _data[key] as List;
    list.removeWhere((item) => item['id'] == id);
    await _saveToFile();
  }

  Future<DateTime?> getLastUpdate() async {
    await initialize();
    final lastUpdate = _data['lastUpdate'];
    if (lastUpdate != null) {
      return DateTime.parse(lastUpdate);
    }
    return null;
  }

  Future<void> refresh() async {
    await initialize();
    try {
      if (_jsonFile != null && await _jsonFile!.exists()) {
        final content = await _jsonFile!.readAsString();
        final newData = json.decode(content) as Map<String, dynamic>;
        final newLastUpdate = DateTime.parse(newData['lastUpdate'] ?? DateTime.now().toIso8601String());
        final currentLastUpdate = await getLastUpdate();
        
        if (currentLastUpdate == null || newLastUpdate.isAfter(currentLastUpdate)) {
          _data = newData;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Erreur refresh JSON: $e');
      }
    }
  }
}

