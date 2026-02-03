import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/my_divider.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/label_value_row_text.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/pay_now_bottom_sheet.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/payment_listtile.dart';

class OrderCheckoutView extends StatelessWidget {
  const OrderCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.whiteColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Text(
                'Order summary',
                style: AppStyles.normalTextBlack(fontSize: 20),
              ),
            ),
            LabelValueRow(label: 'Order price', value: '120'),
            LabelValueRow(label: 'Taxes', value: '20'),
            LabelValueRow(label: 'Deleviery Fees', value: '20'),
            MyDivider(),
            LabelValueRow(
              label: 'Total',
              value: '400',
              showCurrency: true,
              labelStyle: AppStyles.normalTextBlack(fontSize: 20),
              valueStyle: AppStyles.normalTextBlack(fontSize: 20),
            ),
            LabelValueRow(
              label: 'Estimated delivery time:',
              value: '15 - 30 mins',
              showCurrency: false,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: Text(
                'Payment methods',
                style: AppStyles.normalTextBlack(fontSize: 20),
              ),
            ),

            ListTile(
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
            ),
            SizedBox(height: 20.h),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              leading: Image.asset('assets/images/visa.png', width: 50.h),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Depit card',
                    style: AppStyles.normalText(
                      fontSize: 15,
                    ).copyWith(color: AppColors.blackColor),
                  ),
                  Text(
                    '3566 **** **** 0505',
                    style: AppStyles.normalText(
                      fontSize: 15,
                    ).copyWith(color: AppColors.darkGreyColor),
                  ),
                ],
              ),
              textColor: AppColors.blackColor,
              tileColor: Color(0xFFF3F4F6),
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 16.w,
              ),

              trailing: Radio<String>(
                value: 'visa',
                groupValue: 'visa',
                activeColor: AppColors.primaryColor,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
      bottomSheet: PayNowBottomSheet(),
    );
  }
}
