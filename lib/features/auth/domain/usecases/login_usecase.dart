import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/auth/domain/entities/user_entity.dart';
import 'package:hungry_app/features/auth/domain/repo_abstract/auth_repo_abstarct.dart';

class LoginUsecase implements BaseUseCase<UserEntity,LoginParams> {
  final AuthRepo authRepo;
  LoginUsecase({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await authRepo.login(email: params.email, password: params.password);
  }
}


class LoginParams extends Equatable{
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
  
  @override
  List<Object> get props => [
    email,
    password
  ];


}
