import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class CustomCategoriesListViewItem extends StatelessWidget {
  final String name;
  final bool isSelected;
  final bool isAll;

  const CustomCategoriesListViewItem({
    super.key,
    required this.name,
    this.isSelected = false,
    this.isAll = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = (isAll || isSelected)
        ? AppColors.primaryColor
        : AppColors.greyColor;

    final textColor = (isAll || isSelected)
        ? AppColors.whiteColor
        : AppColors.darkGreyColor;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: isAll ? 52 : 95,
      height: 45,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(isAll ? 999 : 14),
        boxShadow: (isAll || isSelected)
            ? [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Center(
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.normalText(fontSize: isAll ? 16 : 14)
              .copyWith(color: textColor),
        ),
      ),
    );
  }
}
