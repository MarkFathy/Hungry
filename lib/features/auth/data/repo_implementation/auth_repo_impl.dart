import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/exceptions.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/auth/data/data_source/auth_local_datasource.dart';
import 'package:hungry_app/features/auth/data/data_source/auth_remote_datasource.dart';
import 'package:hungry_app/features/auth/domain/entities/user_entity.dart';
import 'package:hungry_app/features/auth/domain/repo_abstract/auth_repo_abstarct.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepoImpl({
    required this.authRemoteDatasource,
    required this.authLocalDatasource,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDatasource.login(
        email: email,
        password: password,
      );
      await authLocalDatasource.cacheToken(user.token);
     

      return Right(user);
    } on InvalidCredentialsException catch (e) {
      return Left(InvalidCredentialsFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    File? image,
  }) async {
    try {
      final user = await authRemoteDatasource.register(
        name: name,
        email: email,
        password: password,
        phone: phone,
        image: image,
      );
      await authLocalDatasource.cacheToken(user.token);
      return Right(user);
    } on InvalidCredentialsException catch (e) {
      return Left(InvalidCredentialsFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await authLocalDatasource.clearToken();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await authLocalDatasource.getCachedToken();
    return token != null && token.isNotEmpty;
  }
}
