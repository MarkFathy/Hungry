import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hungry_app/core/error/dio_exception_handler.dart';
import 'package:hungry_app/core/network/api_const.dart';
import 'package:hungry_app/core/utils/api_services.dart';
import 'package:hungry_app/features/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile({
    required String name,
    required String email,
    required String address,
    required String password,
    File? image,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiServices apiServices;

  ProfileRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<ProfileModel> getProfile() async {
    try{
     final response = await apiServices.get(
      endPoint: ApiConst.profile,
    );
    return ProfileModel.fromJson(response['data']);
    }on DioException catch (e) {
      throw DioExceptionHandler.handle(e);
    }
    
  }
  
   @override
  Future<ProfileModel> updateProfile({
    required String name,
    required String email,
    required String address,
    required String password,
    File? image,
  }) async {
    dynamic data;
    if (image != null) {
      data = FormData.fromMap({
        'name': name,
        'email': email,
        'address': address,
        'password': password,
        'image': await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
      });
    } else {
      data = {
        'name': name,
        'email': email,
        'address': address,
        'password': password,
      };
    }

    final response = await apiServices.post(endPoint: ApiConst.updateProfile, data: data);
    return ProfileModel.fromJson(response['data']);
  }
}
