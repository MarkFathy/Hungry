import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_circular_indicator.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/increment_and_decrement_button.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity item;
  final bool isRemoving;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.item,
    this.isRemoving = false,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      shadowColor: AppColors.darkGreyColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  item.image,
                  width: 130.w,
                  height: 130.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 120.w,
                  child: Text(
                    item.name,
                    style: AppStyles.normalTextBlack(fontSize: 16),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                  style: AppStyles.normalTextBlack(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                // Quantity controls
                Row(
                  children: [
                    IncrementAndDecrementButton(
  text: '-',
  onPressed: item.quantity > 1
      ? () {
          context.read<CartCubit>().changeQuantity(
                itemId: item.itemId,
                quantity: item.quantity - 1,
              );
        }
      : () {},
),

                    SizedBox(width: 10.w),
                    Text(
                      '${item.quantity}',
                      style: AppStyles.normalTextBlack(fontSize: 25),
                    ),
                    SizedBox(width: 10.w),
IncrementAndDecrementButton(
  text: '+',
  onPressed: () {
    context.read<CartCubit>().changeQuantity(
          itemId: item.itemId,
          quantity: item.quantity + 1,
        );
  },
),
                  ],
                ),
                SizedBox(height: 20.h),

                // Remove button
                SizedBox(
                  width: 150.w,
                  child: isRemoving
                      ? const Center(
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CustomCircularProgress(
                                color: AppColors.primaryColor,
                                
                              )),
                        )
                      : CustomButton(
                          text: 'Remove',
                          onPressed: onRemove,
                          height: 45.h,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
