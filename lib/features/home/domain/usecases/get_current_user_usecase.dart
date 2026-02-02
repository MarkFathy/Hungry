import 'package:dartz/dartz.dart';
import '../../../../core/entities/user_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../auth/domain/repo_abstract/auth_repo_abstarct.dart';
import '../../../../core/usecase/base_usecase.dart';

class GetCurrentUserUseCase implements BaseUseCase<UserEntity, NoParams> {
  final AuthRepo authRepo;

  GetCurrentUserUseCase({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await authRepo.getCachedUser();
  }
}
