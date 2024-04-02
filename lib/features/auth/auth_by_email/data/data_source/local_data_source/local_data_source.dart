import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalDataSource {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String accessToken, String refreshToken) async {
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<void> saveId(String userId) async {
    await _storage.write(key: 'user_id', value: userId);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refresh_token');
  }

  Future<void> deleteAllTokens() async {
    await _storage.deleteAll();
  }

  Future<String?> getCustomerId() async {
    return await _storage.read(key: 'user_id');
  }
}
