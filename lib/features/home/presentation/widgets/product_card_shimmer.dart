import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/shimmer_box.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerBox(
              width: double.infinity,
              height: 110.h,
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(height: 8.h),

            ShimmerBox(
              width: double.infinity,
              height: 12.h,
              borderRadius: BorderRadius.circular(4),
            ),
            SizedBox(height: 6.h),

            ShimmerBox(
              width: 80.w,
              height: 12.h,
              borderRadius: BorderRadius.circular(4),
            ),
            SizedBox(height: 10.h),

            Row(
              children: [
                ShimmerBox(
                  width: 50.w,
                  height: 12.h,
                  borderRadius: BorderRadius.circular(4),
                ),
                const Spacer(),
                ShimmerBox(
                  width: 20.w,
                  height: 20.w,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsGridShimmer extends StatelessWidget {
  const ProductsGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      delegate: SliverChildBuilderDelegate(
        (_, __) => const ProductCardShimmer(),
        childCount: 10,
      ),
    );
  }
}
