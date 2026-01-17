import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_colors.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: 0.7,
      onChanged: (v) {},
      activeColor: AppColors.primaryColor,
      autofocus: true,
    );
  }
}
