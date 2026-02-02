import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/core/entities/user_entity.dart';
import 'package:hungry_app/features/auth/domain/repo_abstract/auth_repo_abstarct.dart';

class RegisterUsecase implements BaseUseCase<UserEntity, RegisterParams> {
  final AuthRepo authRepo;
  RegisterUsecase({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await authRepo.register(
      name: params.name,
      email: params.email,
      phone: params.phone,
      password: params.password,
      image: params.image,
    );
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String phone;
  final String password;
  final File? image;

  RegisterParams({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
  });
}
