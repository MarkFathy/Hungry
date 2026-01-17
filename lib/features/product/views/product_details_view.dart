import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/features/product/views/widgets/spicy_slider.dart';
import 'package:hungry_app/features/product/views/widgets/toppings_listview.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.whiteColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/test2.png', height: 250.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Customize',
                            style: AppStyles.normalText(
                              fontSize: 16,
                            ).copyWith(color: AppColors.blackColor),
                            children: [
                              TextSpan(
                                text:
                                    ' Your Burger to Your Tastes. Ultimate Experience',
                                style: AppStyles.normalText(
                                  fontSize: 15,
                                ).copyWith(color: AppColors.darkGreyColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.h),
                          child: Text(
                            'Spicy?',
                            style: AppStyles.permanentStyleText(
                              fontSize: 16,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        SpicySlider(),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  'Toppings',
                  style: AppStyles.normalTextBlack(fontSize: 16),
                ),
              ),
              ToppingsListview(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  'Side Options',
                  style: AppStyles.normalTextBlack(fontSize: 16),
                ),
              ),
              ToppingsListview(),
              Padding(
  padding: EdgeInsets.only(top: 20.h),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Left side: Total label and price stacked vertically
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total',
            style: AppStyles.normalTextBlack(
              fontSize: 17,
            ).copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5.h),
          Text(
            '\$18.19',
            style: AppStyles.normalTextBlack(fontSize: 20).copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),

      Spacer(),

      CustomButton(
        text: 'Add To Cart',
        onPressed: () {},
        height: 60.h,
      ),
    ],
  ),
)

            ],
          ),
        ),
      ),
    );
  }
}
