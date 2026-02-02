import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/cart/domain/entity/cart_item_entity.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_state.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/cart_item.dart';

class CartCardListView extends StatelessWidget {
  final List<CartItemEntity> items;
  const CartCardListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        final state = cartCubit.state;
        final isRemoving =
            state is CartRemovingItemState && state.itemId == item.itemId;

        return Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: CartItem(
            item: item,
            onRemove: () {
              cartCubit.removeItem(item.itemId);
            },
            isRemoving: isRemoving,
          ),
        );
      },
    );
  }
}
