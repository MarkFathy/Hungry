import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/usecase/base_usecase.dart';
import 'package:hungry_app/features/profile/domain/entity/profile_entity.dart';
import 'package:hungry_app/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:hungry_app/features/profile/domain/usecases/logout_usecase.dart';
import 'package:hungry_app/features/profile/domain/usecases/update_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final LogoutUsecase logoutUsecase;

  ProfileCubit({
    required this.updateProfileUseCase,
    required this.getProfileUseCase,
    required this.logoutUsecase,
  }) : super(ProfileInitial());

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEditing = false;
  File? pickedImage;
  ProfileEntity? profileEntity;

  // Snapshot for cancel
  String? _oldName;
  String? _oldAddress;
  File? _oldImage;

  void toggleEditing() {
    if (!isEditing) {
      // حفظ نسخة من البيانات قبل التعديل
      _oldName = nameController.text;
      _oldAddress = addressController.text;
      _oldImage = pickedImage;
    }

    isEditing = !isEditing;
    emit(ProfileEditModeState(isEditing));
  }

  void cancelEditing() {
    nameController.text = _oldName ?? nameController.text;
    addressController.text = _oldAddress ?? addressController.text;
    pickedImage = _oldImage;

    isEditing = false;
    emit(ProfileEditModeState(false));
  }

 Future<void> pickImage(File image) async {
  pickedImage = image;
  emit(ProfileImageUpdatedState(pickedImage!)); 
}

  Future<void> getProfile() async {
    emit(ProfileLoadingState());

    final result = await getProfileUseCase(NoParams());

    result.fold(
      (failure) => emit(ProfileFailureState(failure.message)),
      (profile) {
        profileEntity = profile;
        nameController.text = profile.name;
        emailController.text = profile.email;
        addressController.text = profile.address ?? '';
        passwordController.text = '********';
        
        emit(ProfileLoadedState()); // ✅ هنا نستخدم Loaded وليس Success
      },
    );
  }

  Future<void> saveProfile() async {
    emit(ProfileSavingState());

    final result = await updateProfileUseCase(
      UpdateProfileParams(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        address: addressController.text.trim(),
        password: passwordController.text,
        imagePath: pickedImage?.path,
      ),
    );

    result.fold(
      (f) => emit(ProfileFailureState(f.message)),
      (updatedProfile) {
        profileEntity = updatedProfile;
        pickedImage = null;
        isEditing = false;

        nameController.text = updatedProfile.name;
        emailController.text = updatedProfile.email;
        addressController.text = updatedProfile.address ?? '';
        passwordController.text = '********';

        emit(ProfileUpdatedSuccessState(updatedProfile)); 
      },
    );
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());

    final result = await logoutUsecase(NoParams());

    result.fold(
      (failure) => emit(LogoutFailureState(failure.message)),
      (_) => emit(LogoutSuccessState()),
    );
  }
}
