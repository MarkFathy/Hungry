import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class IncrementAndDecrementButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double size;
  final Color? backgroundColor;
  final Color? textColor;

  const IncrementAndDecrementButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = 30,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: size.w,
          height: size.h,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: AppStyles.normalText(
                fontSize: size * 0.7,
              ).copyWith(color: textColor ?? Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
