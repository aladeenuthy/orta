import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  LocalStorage({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  final FlutterSecureStorage _storage;

  Future<void> init() async {}

  Future<void> setString({
    required String key,
    required String value,
  }) {
    return _storage.write(key: key, value: value);
  }

  Future<String> getString({
    required String key,
  }) async {
    return await _storage.read(key: key) ?? '';
  }

  Future<void> setBool({
    required String key,
    required bool value,
  }) {
    return _storage.write(key: key, value: value.toString());
  }

  Future<bool> getBool({
    required String key,
    bool defaultValue = false,
  }) async {
    final value = await _storage.read(key: key);

    if (value == null) return defaultValue;

    return value.toLowerCase() == 'true';
  }

  Future<void> setInt({
    required String key,
    required int value,
  }) {
    return _storage.write(key: key, value: value.toString());
  }

  Future<int?> getInt({
    required String key,
  }) async {
    final value = await _storage.read(key: key);

    if (value == null || value.isEmpty) return null;

    return int.tryParse(value);
  }

  Future<void> setMap({
    required String key,
    required Map<String, dynamic> value,
  }) {
    return _storage.write(
      key: key,
      value: jsonEncode(value),
    );
  }

  Future<Map<String, dynamic>> getMap({
    required String key,
  }) async {
    final value = await _storage.read(key: key);

    if (value == null || value.isEmpty) return <String, dynamic>{};

    final decodedValue = jsonDecode(value);

    if (decodedValue is! Map) return <String, dynamic>{};

    return Map<String, dynamic>.from(decodedValue);
  }

  Future<void> setStringList({
    required String key,
    required List<String> value,
  }) {
    return _storage.write(
      key: key,
      value: jsonEncode(value),
    );
  }

  Future<List<String>> getStringList({
    required String key,
  }) async {
    final value = await _storage.read(key: key);

    if (value == null || value.isEmpty) return <String>[];

    final decodedValue = jsonDecode(value);

    if (decodedValue is! List) return <String>[];

    return List<String>.from(decodedValue);
  }

  Future<void> removeKey(String key) {
    return _storage.delete(key: key);
  }

  Future<void> clearAll() {
    return _storage.deleteAll();
  }
}