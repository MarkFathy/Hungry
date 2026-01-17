import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/features/product/views/widgets/topping_card.dart';

class ToppingsListview extends StatelessWidget {
  const ToppingsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 20.w), // space between cards
          child: ToppingCard(
            title: 'Tomato',
            imagePath: 'assets/images/tomato.png',
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}
