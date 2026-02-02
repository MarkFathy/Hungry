import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor,
    this.textColor, // optional text color
    required this.text,
    required this.onPressed,
    this.width,
    required this.height,
  });

  final Color? buttonColor;
  final Color? textColor; // optional text color
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: buttonColor ?? AppColors.primaryColor),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppStyles.normalText(
              fontSize: 20,
            ).copyWith(color: textColor ?? AppColors.whiteColor), 
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
