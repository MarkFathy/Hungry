import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/profile/domain/entity/profile_entity.dart';
import 'package:hungry_app/features/profile/domain/usecases/update_profile_usecase.dart';

abstract class ProfileRepo {
  Future<Either<Failure,ProfileEntity>>  getProfile();
  Future<Either<Failure, ProfileEntity>> updateProfile(UpdateProfileParams params);


}
