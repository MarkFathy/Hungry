import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class CashOnDeleiveryCard extends StatelessWidget {
  const CashOnDeleiveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              leading: Image.asset('assets/images/dollar.png', width: 50.h),
              title: Text(
                'Cash on delivery',
                style: AppStyles.normalText(fontSize: 15),
              ),
              textColor: AppColors.whiteColor,
              tileColor: AppColors.brownColor,
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 16.w,
              ),

              trailing: Radio<String>(
                value: 'Cash',
                groupValue: 'Cash',
                activeColor: AppColors.whiteColor,
                onChanged: (value) {},
              ),
            );
  }
}