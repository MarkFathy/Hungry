import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/app_strings.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding:  EdgeInsets.only(
    left: 20.w,
    top: 55.h,
    right: 20.w,
    bottom: 15.h,
  ),
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.appName,
            style: AppStyles.permanentStyleText(
              fontSize: 30,
            ).copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: 5.h), // small spacing
          Text(
            "Hello, Mark Fathy",
            style: AppStyles.normalText(fontSize: 14)
                .copyWith(color: AppColors.greyColor),
          ),
        ],
      ),
      Spacer(),
      CircleAvatar(backgroundColor: Colors.grey, radius: 28.r),
    ],
  ),
);
  }
}