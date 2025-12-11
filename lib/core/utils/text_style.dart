import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

abstract class AppStyles {
  
  static TextStyle permanentStyleText({required double fontSize}) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: "PermanentMarker",
      //fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    );
    
  }

static TextStyle normalText({required double fontSize}) {
    return TextStyle(
      fontSize: fontSize.sp,
      //fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    );

    
  }

}
