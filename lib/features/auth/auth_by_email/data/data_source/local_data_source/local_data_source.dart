import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalDataSource {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static const String _tokenKey = 'TOKEN_KEY';

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }
}
