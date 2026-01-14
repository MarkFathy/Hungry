import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routes/router_names.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/app_strings.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_circular_indicator.dart';
import 'package:hungry_app/core/widgets/snack_bar_helper.dart';
import 'package:hungry_app/core/utils/validators.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:hungry_app/features/auth/presentation/views/widgets/auth_text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailureState) {
          SnackBarHelper.showError(context, state.message);
        } else if (state is AuthSuccessState) {
          SnackBarHelper.showSuccess(context, 'Login successful');
          context.push(RouterNames.bottomNavBar);
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
                    SizedBox(height: 120.h),
                    Text(
                      AppStrings.appName,
                      style: AppStyles.permanentStyleText(fontSize: 55),
                    ),
                    Text(
                      'Welcome Back, Discover The Fast Food',
                      style: AppStyles.normalText(fontSize: 12),
                    ),
                    SizedBox(height: 60.h),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        labelText: 'Email',
                        controller: cubit.emailController,
                        validator: Validators.email,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CustomTextField(
                        labelText: 'Password',
                        controller: cubit.passwordController,
                        isPassword: true,
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                        validator: Validators.password,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    state is AuthLoadingState
                        ? const CustomCircularProgress(size: 40)
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                              text: 'Login',
                              height: 60.h,
                              width: double.infinity,
                              buttonColor: AppColors.whiteColor,
                              onPressed: () {
                                cubit.enableValidation();
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.login();
                                }
                              },
                            ),
                          ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Text(
                        '- OR -',
                        style: AppStyles.permanentStyleText(fontSize: 16),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: 'Register',
                        onPressed: () {
                          context.push(RouterNames.register);
                        },
                        height: 60.h,
                        width: double.infinity,
                        buttonColor: AppColors.whiteColor,
                      ),
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
