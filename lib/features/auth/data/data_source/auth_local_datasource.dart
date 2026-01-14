import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheToken(String token);
  Future<String?> getCachedToken();
  Future<void> clearToken();

  // Future<void> cacheUser(UserModel user);
  // Future<UserModel?> getCahedUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDatasource {
  final FlutterSecureStorage secureStorage;
  AuthLocalDataSourceImpl(this.secureStorage);
  static const _tokenKey = 'auth_token';

  @override
  Future<void> cacheToken(String token) async {
      print('CACHING TOKEN: $token');
    await secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<void> clearToken() async {
    await secureStorage.delete(key: _tokenKey);
  }

  @override
  Future<String?> getCachedToken() async{
    return await secureStorage.read(key:_tokenKey);
  }
}
