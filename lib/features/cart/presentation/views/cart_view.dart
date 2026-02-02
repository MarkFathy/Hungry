import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_circular_indicator.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_state.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/cart_card_list_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Padding(
  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
  child: BlocBuilder<CartCubit, CartState>(
    builder: (context, state) {
      if (state is CartLoadingState) {
        return const Center(child: CustomCircularProgress(
          color: AppColors.primaryColor,
        ));
      } else if (state is CartErrorState) {
        return Center(child: Text(state.message));
      } else if (state is CartSuccessState || state is CartRemovingItemState) {
        // ✅ Show the list whether we're removing or not
        final items = state is CartSuccessState
            ? state.items
            : (state as CartRemovingItemState).items;
        return CartCardListView(items: items);
      }
      return const SizedBox();
    },
  ),
),

      bottomSheet: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccessState) {
            final total = state.items.fold<double>(
              0,
              (sum, item) => sum + (item.price * item.quantity),
            );

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              color: AppColors.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: AppStyles.normalTextBlack(fontSize: 16)
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: AppStyles.normalTextBlack(fontSize: 20)
                            .copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: 'Checkout',
                    onPressed: () {},
                    height: 50.h,
                  ),
                ],
              ),
            );
          }
                    return const SizedBox();

        },
      ),
    );

  }
}
