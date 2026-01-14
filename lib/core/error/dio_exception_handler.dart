import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/error_message_model.dart';
import '../error/exceptions.dart';

class DioExceptionHandler {
  static AppException handle(DioException e) {
    
    // 1️⃣ Timeout & connection issues
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return const NetworkException('No internet connection');
    }

    // 2️⃣ Server responded with error
    if (e.response != null) {
      try {
        final data = e.response!.data;

        // Backend returned known error format
        if (data is Map<String, dynamic>) {
          final errorModel = ErrorMessageModel.fromJson(data);
          return ServerException(errorModel);
        }

        // Backend returned unknown format
        return ServerException(
          ErrorMessageModel(
            statusCode: e.response!.statusCode ?? 500,
            statusMessage: 'Unexpected server error',
            success: false,
          ),
        );
      } catch (_) {
        return ServerException(
          ErrorMessageModel(
            statusCode: e.response!.statusCode ?? 500,
            statusMessage: 'Server error',
            success: false,
          ),
        );
      }
    }

    if (e.type == DioExceptionType.cancel) {
      return const NetworkException('Request was cancelled');
    }

    // 4️⃣ Fallback
    return const NetworkException('Something went wrong');
  }
}
