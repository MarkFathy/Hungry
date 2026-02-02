import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class ToppingCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected; // new
  final VoidCallback? onAdd;
  final VoidCallback? onTapCard;

  const ToppingCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.isSelected = false, // default false
    this.onAdd,
    this.onTapCard,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTapCard,
        child: Container(
          width: 100.w,
          height: 125.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Stack(
            children: [
              // Bottom brown container
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.brownColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: AppStyles.normalText(
                              fontSize: 14,
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),

                          // Plus / Minus button
                          GestureDetector(
                            onTap: onAdd,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: AppColors.redColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isSelected ? Icons.remove : Icons.add, // change icon
                                color: Colors.white,
                                size: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9.h),
                    ],
                  ),
                ),
              ),

              // Top white container with image
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Image.network(
                      imagePath,
                      width: 55.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
