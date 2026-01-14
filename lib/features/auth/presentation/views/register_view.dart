import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routes/router_names.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/utils/validators.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_circular_indicator.dart';
import 'package:hungry_app/core/widgets/snack_bar_helper.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:hungry_app/features/auth/presentation/views/widgets/auth_text_form_field_widget.dart';
import 'package:hungry_app/features/auth/presentation/views/widgets/upload_image_circle.dart';
import 'package:image_picker/image_picker.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          SnackBarHelper.showError(context, state.message);
        } else if (state is AuthSuccessState) {
          SnackBarHelper.showSuccess(context, 'Login successful');
          context.pushReplacement(RouterNames.bottomNavBar);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Scaffold(
          backgroundColor: AppColors.primaryColor,

          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: cubit.formKey,
                autovalidateMode: cubit.showValidationErrors
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    SizedBox(height: 60.h),

                    UploadImageCircle(
                      imageFile: cubit.pickedImage,
                      onPressed: () async {
                        final picker = ImagePicker();
                        final picked = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (picked != null) {
                          cubit.setPickedImage(File(picked.path));
                        }
                      },
                      onDelete: () {
                        cubit.setPickedImage(null);
                      },
                    ),

                    SizedBox(height: 30.h),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        labelText: 'Name',
                        controller: cubit.nameController,
                        validator: Validators.name,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        labelText: 'Email',
                        controller: cubit.emailController,
                        validator: Validators.email,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        labelText: 'Phone',
                        controller: cubit.phoneController,
                        validator: Validators.phone,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        labelText: 'Password',
                        isPassword: true,
                        controller: cubit.passwordController,
                        validator: Validators.password,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        labelText: 'Confirm Password',
                        isPassword: true,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        controller: cubit.confirmPasswordController,
                        validator: (value) => Validators.confirmPassword(
                          value: value,
                          password: cubit.passwordController.text,
                        ),
                      ),
                    ),

                    SizedBox(height: 35.h),

                    state is AuthLoadingState
                        ? const CustomCircularProgress()
                        : CustomButton(
                            text: 'Signup',

                            onPressed: () {
                              cubit.enableValidation();

                              if (cubit.formKey.currentState!.validate()) {
                                cubit.register();
                              }
                            },
                            height: 60.h,
                            width: double.infinity,
                            buttonColor: AppColors.whiteColor,
                          ),
                    SizedBox(height: 12.h),

                    TextButton(
                      child: Text(
                        'You Already have an acccount,',
                        style: AppStyles.normalText(fontSize: 14),
                      ),
                      onPressed: () {
                        context.push(RouterNames.login);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
