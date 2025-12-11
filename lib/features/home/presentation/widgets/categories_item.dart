import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class CustomCategoriesListViewItem extends StatelessWidget {
  final String name;

  const CustomCategoriesListViewItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.greyColor,
      ),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: AppStyles.normalText(fontSize: 14).copyWith(color: AppColors.darkGreyColor),
          maxLines: 1,
        ),
      ),
    );
  }
}
