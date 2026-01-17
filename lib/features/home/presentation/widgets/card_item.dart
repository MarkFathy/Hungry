import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      shadowColor: AppColors.darkGreyColor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/test.png',
              width: 150.w,
              height: 150.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8.h),
            Text('Cheeseburger'),
            Text("Wendy's Burger"),
            Row(
              children: [
                Text("⭐ 4.6"),
                Spacer(),
                Icon(Icons.favorite,color:AppColors.primaryColor,)
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
