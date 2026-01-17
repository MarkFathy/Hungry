import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/cart/presentation/views/widgets/cart_item.dart';

class CartCardListView extends StatelessWidget {
  const CartCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 20.w), // space between cards
        child: CartItem(),
      ),
      itemCount: 6,
    );
  }
}
