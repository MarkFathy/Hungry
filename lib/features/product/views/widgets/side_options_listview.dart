import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/product/views/cubit/product_cubit.dart';
import 'package:hungry_app/features/product/views/widgets/card_shimmer.dart';
import 'package:hungry_app/features/product/views/widgets/topping_card.dart';

class SideOptionsListView extends StatelessWidget {
  const SideOptionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state.isLoadingSideOptions && state.sideOptions.isEmpty) {
          return  const CardShimmerListView();
        }

        return SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.sideOptions.length,
            itemBuilder: (_, index) {
              final item = state.sideOptions[index];
              return Padding(
                padding: EdgeInsets.only(right: 5.w,left: 5.w),
                child: ToppingCard(title: item.name, imagePath: item.image),
              );
            },
          ),
        );
      },
    );
  }
}
