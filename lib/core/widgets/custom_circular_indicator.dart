import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';

class CustomCircularProgress extends StatelessWidget {
  final double? size;
  final Color color; 

  const CustomCircularProgress({
    super.key,
    this.size,
    this.color = AppColors.whiteColor, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 30.h,
      width: size ?? 30.w,
      child: CircularProgressIndicator(
        color: color, 
        strokeWidth: 3,
      ),
    );
  }
}
