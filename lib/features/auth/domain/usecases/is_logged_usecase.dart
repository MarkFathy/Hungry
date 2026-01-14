import 'package:hungry_app/features/auth/domain/repo_abstract/auth_repo_abstarct.dart';

class IsLoggedInUsecase {
  final AuthRepo authRepo;

  IsLoggedInUsecase({required this.authRepo});

  Future<bool> call() async {
    return await authRepo.isLoggedIn();
  }
}
