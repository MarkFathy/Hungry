import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';

Future<void> showSuccessDIalog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (v) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 230.h, horizontal: 70.w),
        child: Container(
          padding: EdgeInsets.all(12),
          height: 300.h,
          width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                radius: 40.r,
                child: Icon(
                  Icons.check_sharp,
                  size: 50.sp,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                'Success !',
                style: AppStyles.normalTextBlack(
                  fontSize: 25,
                ).copyWith(color: AppColors.primaryColor),
              ),
              SizedBox(height: 10),
              Text(
                'Your payment was successful.\nA receipt for this purchase has\nbeen sent to your email.',
                style: TextStyle(color: AppColors.darkGreyColor, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: CustomButton(
                  text: 'Go Back',
                  onPressed: () {
                    context.pop();
                  },
                  height: 50.h,
                  width: 140.w,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
