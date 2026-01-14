import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/failure.dart';
import 'package:hungry_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

   Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    File? image,
  });


  Future<Either<Failure, void>> logout();

 Future<bool> isLoggedIn();






}
