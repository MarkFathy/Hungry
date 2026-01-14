import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_const.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);

  // GET request
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      '${ApiConst.baseUrl}$endPoint',
      queryParameters: queryParameters,
    );
    return response.data;
  }

  // POST request
  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic data, // can be Map<String,dynamic> or FormData
  }) async {
    final response = await _dio.post('${ApiConst.baseUrl}$endPoint', data: data);
    return response.data;
  }

  // PUT request
  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final response = await _dio.put('${ApiConst.baseUrl}$endPoint', data: data);
    return response.data;
  }

  // DELETE request
  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final response = await _dio.delete('${ApiConst.baseUrl}$endPoint', data: data);
    return response.data;
  }
}
