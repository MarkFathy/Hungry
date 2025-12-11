import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/app_strings.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/features/auth/presentation/widgets/auth_text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 120.h),
            Text(
              AppStrings.appName,
              style: AppStyles.permanentStyleText(fontSize: 55),
            ),
            Text(
              'Welcome Back ,Discover The Fast Food',
              style: AppStyles.normalText(fontSize: 12),
            ),
            SizedBox(height: 60.h),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomTextField(labelText: 'Email'),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomTextField(
                labelText: 'Password',
                obscureText: false,
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),

            SizedBox(height: 50.h),

            CustomButton(
              text: 'Login',

              onPressed: () {},
              height: 60.h,
              width: double.infinity,
              buttonColor: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
