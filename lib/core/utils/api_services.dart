import 'package:dio/dio.dart';
import 'package:hungry_app/features/auth/data/data_source/auth_local_datasource.dart';

class ApiServices {
  final Dio _dio;
  final AuthLocalDatasource authLocalDatasource;

  ApiServices(this._dio, this.authLocalDatasource) {
    // إضافة BaseUrl + Authorization Interceptor
    _dio.options.baseUrl =
        "https://sonic-zdi0.onrender.com/api"; // ApiConst.baseUrl

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await authLocalDatasource.getCachedToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    // Logging optional
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(endPoint, queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic data,
  }) async {
    final response = await _dio.post(endPoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    dynamic data,
  }) async {
    final response = await _dio.put(endPoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final response = await _dio.delete(endPoint, data: data);
    return response.data;
  }
}
