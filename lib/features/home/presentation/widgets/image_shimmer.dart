import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/shimmer_box.dart';

class ImageShimmer extends StatelessWidget {
  const ImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerBox(
      width: double.infinity,
      height: 110.h,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
