import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final bool showCurrency; // optional, default true

  const LabelValueRow({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
    this.showCurrency = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: labelStyle ?? AppStyles.normalTextBlack(fontSize: 15).copyWith(
              color: AppColors.darkGreyColor,
            ),
          ),
          const Spacer(),
          Text(
            showCurrency ? '$value EGP' : value,
            style: valueStyle ?? AppStyles.normalTextBlack(fontSize: 15).copyWith(
              color: AppColors.darkGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
