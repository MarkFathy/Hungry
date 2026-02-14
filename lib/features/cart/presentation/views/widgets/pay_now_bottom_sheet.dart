import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/success_dialog.dart';

class PayNowBottomSheet extends StatelessWidget {
  const PayNowBottomSheet({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: AppStyles.normalTextBlack(
                  fontSize: 16,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5.h),
              Text(
                '$text EGP',
                style: AppStyles.normalTextBlack(fontSize: 20).copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CustomButton(
            text: 'Pay Now',
            onPressed: () {
              
              
              showSuccessDIalog(context: context);
            },
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
