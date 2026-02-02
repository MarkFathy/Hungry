import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/exceptions.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:hungry_app/features/profile/domain/abstract_repo/profile_repo.dart';
import 'package:hungry_app/features/profile/domain/entity/profile_entity.dart';
import 'package:hungry_app/features/profile/domain/usecases/update_profile_usecase.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final profile = await profileRemoteDataSource.getProfile();
      return Right(profile);
    } on InvalidCredentialsException catch (e) {
      return Left(InvalidCredentialsFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
    @override
  Future<Either<Failure, ProfileEntity>> updateProfile(UpdateProfileParams params) async {
    try {
      final profile = await profileRemoteDataSource.updateProfile(
        name: params.name,
        email: params.email,
        address: params.address,
        password: params.password,
        image: params.imagePath != null ? File(params.imagePath!) : null,
      );
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
