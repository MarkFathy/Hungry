import 'dart:io';

import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserEntity user;
  const AuthSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthFailureState extends AuthState {
  final String message;
  const AuthFailureState(this.message);

  @override
  List<Object?> get props => [message];
}

//Image State
class AuthImagePickedState extends AuthState {
  final File? image;
  const AuthImagePickedState(this.image);

  @override
  List<Object?> get props => [image];
}

class AuthFormValidationChanged extends AuthState {}


