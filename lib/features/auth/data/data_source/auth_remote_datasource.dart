import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hungry_app/core/error/dio_exception_handler.dart';
import 'package:hungry_app/core/network/api_const.dart';
import 'package:hungry_app/core/utils/api_services.dart';
import 'package:hungry_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login({required String email, required String password});

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    File? image,
  });

  Future<void> logOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final ApiServices apiServices;
  AuthRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<void> logOut() async {
    await Future.delayed(Duration(microseconds: 500));
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiServices.post(
        endPoint: ApiConst.login,
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response['data']);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    File? image,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        if (image != null)
          'image': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
      });

      final response = await apiServices.post(
        endPoint: ApiConst.register,
        data: formData,
      );

      return UserModel.fromJson(response['data']);
    } on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
  }

}
