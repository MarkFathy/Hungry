import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/auth/domain/usecases/register_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUseCase;
  final RegisterUsecase registerUsecase;
  AuthCubit({required this.registerUsecase, required this.loginUseCase})
    : super(AuthInitial());

  //Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  //Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showValidationErrors = false;
  void enableValidation() {
    showValidationErrors = true;
    emit(AuthFormValidationChanged());
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    emit(AuthLoadingState());

    final result = await loginUseCase(
      LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    result.fold(
      (failure) => emit(AuthFailureState(failure.message)),
      (user) => emit(AuthSuccessState(user)),
    );
  }

  File? pickedImage;
  void setPickedImage(File? image) {
    pickedImage = image;
    emit(AuthImagePickedState(image));
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(AuthLoadingState());

    final result = await registerUsecase(
      RegisterParams(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        image: pickedImage,
      ),
    );

    result.fold(
      (failure) => emit(AuthFailureState(failure.message)),
      (user) => emit(AuthSuccessState(user)),
    );
  }



}
