import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.borderColor,
    this.height = 60,
    this.child,
  });

  final String text;
  final IconData icon;
  final VoidCallback? onTap; 
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.5)
              : null,
        ),
        child: Center(
          child: child ?? // 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: AppStyles.normalTextBlack(fontSize: 18)
                        .copyWith(color: textColor ?? AppColors.primaryColor),
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    icon,
                    size: 25.sp,
                    color: iconColor ?? textColor ?? AppColors.primaryColor,
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
