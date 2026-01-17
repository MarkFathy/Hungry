import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/cart_card_list_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: CartCardListView(), // your scrollable list
            ),
          ],
        ),
      ),

      // Bottom area: total + checkout
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        color: AppColors.whiteColor, // matches your scaffold background
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Total text
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: AppStyles.normalTextBlack(fontSize: 16)
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$18.19', // total value
                  style: AppStyles.normalTextBlack(fontSize: 20)
                      .copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            CustomButton(
              text: 'Checkout',
              onPressed: () {
                // handle checkout
              },
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
