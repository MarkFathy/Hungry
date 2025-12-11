import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
  });
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.whiteColor,
      style: const TextStyle(color: AppColors.whiteColor),

      obscureText: obscureText,
      onTap: onTap,
      readOnly: onTap != null,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.whiteColor,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.whiteColor,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.whiteColor),
        hintStyle: TextStyle(color: AppColors.whiteColor),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        filled: true,
        fillColor: AppColors.primaryColor,

        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.whiteColor),

          borderRadius: BorderRadius.circular(15.r),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.whiteColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}
