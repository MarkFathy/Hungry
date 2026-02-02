import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/profile/domain/abstract_repo/profile_repo.dart';
import 'package:hungry_app/features/profile/domain/entity/profile_entity.dart';

class UpdateProfileUseCase
    implements BaseUseCase<ProfileEntity, UpdateProfileParams> {
  final ProfileRepo profileRepo;

  UpdateProfileUseCase({required this.profileRepo});
  @override
  Future<Either<Failure, ProfileEntity>> call(
    UpdateProfileParams params,
  ) async {
    return await profileRepo.updateProfile(params);
  }
}

class UpdateProfileParams {
  final String name;
  final String email;
  final String address;
  final String password;
  final String? imagePath;

  UpdateProfileParams({
    required this.name,
    required this.email,
    required this.address,
    required this.password,
    this.imagePath,
  });
}
