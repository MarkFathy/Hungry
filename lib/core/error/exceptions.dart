// core/error/exceptions.dart

import '../network/error_message_model.dart';

abstract class AppException implements Exception {
  final String message;
  const AppException(this.message);
}

class ServerException extends AppException {
  final ErrorMessageModel error;
  ServerException(this.error) : super(error.statusMessage);
}

class NetworkException extends AppException {
  const NetworkException(super.message);
}

class CacheException extends AppException {
  const CacheException(super.message);
}

class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException()
      : super('Invalid email or password');
}
