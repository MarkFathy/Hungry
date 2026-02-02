import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/auth/domain/repo_abstract/auth_repo_abstarct.dart';

class LogoutUsecase implements BaseUseCase<void, NoParams> {
  final AuthRepo authRepo;
  LogoutUsecase({required this.authRepo});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepo.logout();
  }
}
