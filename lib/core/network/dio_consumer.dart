import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;
  DioConsumer(this.dio);

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final response = await dio.post(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final response = await dio.put(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    final response = await dio.delete(
      path,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
