// features/auth/data/data_source/auth_local_datasource.dart
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hungry_app/core/entities/user_entity.dart';
import '../models/user_model.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheToken(String token);
  Future<void> cacheUser(UserModel user);
  Future<UserEntity?> getCachedUser();
  Future<void> clearToken();
    Future<String?> getCachedToken();

}

class AuthLocalDataSourceImpl implements AuthLocalDatasource {
  final FlutterSecureStorage secureStorage;
  AuthLocalDataSourceImpl(this.secureStorage);

  static const _tokenKey = 'auth_token';
  static const _userKey = 'auth_user';

  @override
  Future<void> cacheToken(String token) async {
    await secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    await secureStorage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }
   @override
  Future<String?> getCachedToken() async {
    return await secureStorage.read(key: _tokenKey);
  }


  @override
  Future<UserEntity?> getCachedUser() async {
    final jsonString = await secureStorage.read(key: _userKey);
    if (jsonString == null) return null;
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserModel.fromJson(json).toEntity();
  }

  @override
  Future<void> clearToken() async {
    await secureStorage.delete(key: _tokenKey);
    await secureStorage.delete(key: _userKey);
  }
}
