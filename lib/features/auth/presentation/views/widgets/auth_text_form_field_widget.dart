import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.validator,
    this.textColor,      
    this.backgroundColor, 
    this.readOnly,       
    this.onChanged,        
  });

  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final Color? textColor;
  final Color? backgroundColor;
  final bool? readOnly; 
  final ValueChanged<String>? onChanged;


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
    final textColor = widget.textColor ?? AppColors.whiteColor;
    final fillColor = widget.backgroundColor ?? AppColors.primaryColor;

    return TextFormField(
      cursorColor: textColor,
      style: TextStyle(color: textColor),
      obscureText: obscureText,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly ?? widget.onTap != null, 
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        prefixIconColor: textColor,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: textColor,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        suffixIconColor: textColor,
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: textColor),
        hintStyle: TextStyle(color: textColor),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}
