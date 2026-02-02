import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class IncrementAndDecrementButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Color? backgroundColor;
  final Color? textColor;

  const IncrementAndDecrementButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: onPressed,
        child: CircleAvatar(
          radius: 18.r,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            text == '+' ? Icons.add : Icons.remove,
            color: AppColors.whiteColor,
            size: 18.sp,
          ),
        ),
      ),
    );
  }
}
