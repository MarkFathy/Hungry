import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class UserProfileImageContainer extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onEditTap;

  const UserProfileImageContainer({
    super.key,
    this.imageUrl,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 140.w,
            height: 140.h,
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 4.w, color: AppColors.whiteColor),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: imageUrl != null && imageUrl!.isNotEmpty
                    ? NetworkImage(imageUrl!)
                    : const AssetImage('assets/images/default_user.png') as ImageProvider,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onEditTap, 
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.whiteColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.edit,
                  color: AppColors.whiteColor,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
