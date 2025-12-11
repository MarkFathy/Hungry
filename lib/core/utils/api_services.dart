import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  final baseUrl = "";
  ApiServices(this._dio);

  Future<Map<String,dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$endPoint$baseUrl');
    return response.data;
  }
}
