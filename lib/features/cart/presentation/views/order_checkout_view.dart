import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/text_style.dart';
import 'package:hungry_app/core/widgets/my_divider.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cubit/cart_state.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/label_value_row_text.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/pay_now_bottom_sheet.dart';

class OrderCheckoutView extends StatelessWidget {
  const OrderCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.whiteColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    if (state is OrderSummaryState) {
      final s = state.summary;

      return Column(
        children: [
          LabelValueRow(
            label: 'Order price',
            value: s.orderPrice.toStringAsFixed(2),
          ),
          LabelValueRow(
            label: 'Taxes (14%)',
            value: s.tax.toStringAsFixed(2),
          ),
          LabelValueRow(
            label: 'Delivery Fees',
            value: s.deliveryFee.toStringAsFixed(2),
          ),
          MyDivider(),
          LabelValueRow(
            label: 'Total',
            value: s.total.toStringAsFixed(2),
            showCurrency: true,
            labelStyle: AppStyles.normalTextBlack(fontSize: 20),
            valueStyle: AppStyles.normalTextBlack(fontSize: 20),
          ),
        ],
      );
    }

    return const SizedBox();
  },
),

      ),
      bottomSheet: PayNowBottomSheet(),
    );
  }
}
