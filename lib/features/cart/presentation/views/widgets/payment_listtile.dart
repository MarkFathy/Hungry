import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class PaymentMethod<T> extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color tileColor;
  final Color textColor;
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final EdgeInsets? contentPadding;

  const PaymentMethod({
    super.key,
    required this.title,
    required this.imagePath,
    required this.tileColor,
    required this.textColor,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      tileColor: tileColor,
      contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
      leading: Image.asset(imagePath, width: 50.h, height: 50.h),
      title: Text(
        title,
        style: AppStyles.normalText(fontSize: 15).copyWith(color: textColor),
      ),
      trailing: Radio<T>(
        value: value,
        groupValue: groupValue,
        activeColor: textColor,
        onChanged: onChanged,
      ),
    );
  }
}
