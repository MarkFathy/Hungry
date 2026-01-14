import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.isPassword = false, // new
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.validator,
  });

  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool isPassword; // changed from obscureText
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.whiteColor,
      style: const TextStyle(color: AppColors.whiteColor),
      obscureText: obscureText,
      onTap: widget.onTap,
      readOnly: widget.onTap != null,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        prefixIconColor: AppColors.whiteColor,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        suffixIconColor: AppColors.whiteColor,
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: AppColors.whiteColor),
        hintStyle: const TextStyle(color: AppColors.whiteColor),
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
