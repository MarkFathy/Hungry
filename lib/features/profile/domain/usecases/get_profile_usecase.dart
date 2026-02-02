import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/profile/domain/abstract_repo/profile_repo.dart';
import 'package:hungry_app/features/profile/domain/entity/profile_entity.dart';

class GetProfileUseCase implements BaseUseCase<ProfileEntity, NoParams> {
  final ProfileRepo profileRepo;

  GetProfileUseCase({required this.profileRepo});

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async {
    return await profileRepo.getProfile();
  }
}
