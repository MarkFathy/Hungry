import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/increment_and_decrement_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      shadowColor: AppColors.darkGreyColor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/test.png',
                  width: 150.w,
                  height: 150.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Cheeseburger',
                  style: AppStyles.normalTextBlack(fontSize: 16),
                ),
                Text(
                  "Wendy's Burger",
                  style: AppStyles.normalTextBlack(
                    fontSize: 16,
                  ).copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    IncrementAndDecrementButton(text: '-', onPressed: () {}),
                    Text('2', style: AppStyles.normalTextBlack(fontSize: 25)),
                    IncrementAndDecrementButton(text: '+', onPressed: () {}),
                  ],
                ),
                SizedBox(height: 60.h),

                CustomButton(text: 'Remove', onPressed: () {}, height: 40.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
