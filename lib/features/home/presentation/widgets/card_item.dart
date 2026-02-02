import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/entities/product_entity.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/features/home/presentation/widgets/image_shimmer.dart';

class CardItem extends StatelessWidget {
  final ProductEntity product;
  final bool isFavorite; // <-- required now
  final VoidCallback onFavoriteToggle; // <-- required

  const CardItem({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      shadowColor: AppColors.darkGreyColor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: product.image,
              width: double.infinity,
              height: 90.h,
              fit: BoxFit.contain,
              placeholder: (context, url) => ImageShimmer(),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/test.png',
                width: 150.w,
                height: 110.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                product.name,
                style: AppStyles.normalTextBlack(fontSize: 14),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(height: 15.h),
            Center(
              child: Text(
                'EGP ${product.price}',
                style: AppStyles.normalTextBlack(fontSize: 16)
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("⭐ ${product.rating}"),
                  const Spacer(),
                  IconButton(
                    onPressed: onFavoriteToggle,
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? AppColors.primaryColor : AppColors.darkGreyColor,
                      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
