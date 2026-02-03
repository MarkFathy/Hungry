import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_circular_indicator.dart';
import 'package:hungry_app/core/widgets/snack_bar_helper.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:hungry_app/features/product/views/cubit/product_cubit.dart';
import 'package:hungry_app/features/product/views/widgets/card_shimmer.dart';
import 'package:hungry_app/features/product/views/widgets/topping_card.dart';
import '../../../core/entities/product_entity.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.whiteColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image + Title + Spicy
              Row(
                children: [
                  Image.asset('assets/images/test2.png', height: 250.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Customize ',
                            style: AppStyles.normalText(
                              fontSize: 16,
                            ).copyWith(color: AppColors.blackColor),
                            children: [
                              TextSpan(
                                text: product.name,
                                style: AppStyles.normalText(
                                  fontSize: 15,
                                ).copyWith(color: AppColors.darkGreyColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.h),
                          child: Text(
                            'Spicy?',
                            style: AppStyles.permanentStyleText(
                              fontSize: 16,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                        // SpicySlider() // Optional
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // Toppings Section
              Text('Toppings', style: AppStyles.normalTextBlack(fontSize: 16)),
              SizedBox(height: 10.h),
              SizedBox(
                height: 130.h,
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state.isLoadingToppings) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (_, __) => SizedBox(width: 10.w),
                        itemBuilder: (_, __) => const CardShimmer(),
                      );
                    }

                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.toppings.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (_, index) {
                        final topping = state.toppings[index];
                        final isSelected = state.selectedToppings.contains(
                          topping,
                        );
                        return ToppingCard(
                          title: topping.name,
                          imagePath: topping.image,
                          isSelected: state.selectedToppings.contains(
                            topping,
                          ), // <- important
                          onAdd: () {
                            if (!state.selectedToppings.contains(topping)) {
                              context.read<ProductCubit>().addTopping(topping);
                              SnackBarHelper.showSuccess(
                                context,
                                '${topping.name} added!',
                              );
                            } else {
                              context.read<ProductCubit>().removeTopping(
                                topping,
                              );
                              SnackBarHelper.showError(
                                context,
                                '${topping.name} removed!',
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 20.h),

              // Side Options Section
              Text(
                'Side Options',
                style: AppStyles.normalTextBlack(fontSize: 16),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 130.h,
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state.isLoadingSideOptions) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        separatorBuilder: (_, __) => SizedBox(width: 10.w),
                        itemBuilder: (_, __) => const CardShimmer(),
                      );
                    }

                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.sideOptions.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (_, index) {
                        final sideOption = state.sideOptions[index];
                        final isSelected = state.selectedSideOptions.contains(
                          sideOption,
                        );
                        return ToppingCard(
                          title: sideOption.name,
                          imagePath: sideOption.image,
                          onAdd: () {
                            if (!isSelected) {
                              context.read<ProductCubit>().addSideOption(
                                sideOption,
                              );
                              SnackBarHelper.showSuccess(
                                context,
                                '${sideOption.name} added!',
                              );
                            } else {
                              context.read<ProductCubit>().removeSideOption(
                                sideOption,
                              );
                              SnackBarHelper.showError(
                                context,
                                '${sideOption.name} removed!',
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 20.h),

              // Total + Add To Cart
              BlocBuilder<ProductCubit, ProductState>(
                
                builder: (context, state) {
                  final total = context.read<ProductCubit>().computeTotal(
                    product,
                  );
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: AppStyles.normalTextBlack(
                              fontSize: 17,
                            ).copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: AppStyles.normalTextBlack(fontSize: 20)
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                          ),
                        ],
                      ),
                      Spacer(),
                    BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
    return SizedBox(
      height: 60.h,
      width: 160.w, // نفس عرض الزر (ظبطه حسب تصميمك)
      child: state.isAddingToCart
          ? const Center(
              child: CustomCircularProgress(
                color: AppColors.primaryColor,
              ),
            )
          : CustomButton(
              text: 'Add To Cart',
              onPressed: () async {
                await context.read<ProductCubit>().addToCart(product);

                if (context.mounted) {
                  SnackBarHelper.showSuccess(
                    context,
                    '${product.name} added to cart!',
                  );
                }
              },
              height: 60.h,
            ),
    );
  },
),







                    ],
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
