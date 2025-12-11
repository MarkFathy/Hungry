import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/features/root/presentation/controller/cubit/bottom_nav_cubit.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocConsumer<BottomNavBarCubit, BottomNavBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BottomNavBarCubit.get(context);

          return Scaffold(
            body: cubit.bottomNavScreens[cubit.currentIndex],
            bottomNavigationBar: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                selectedItemColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.greyColor,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                type: BottomNavigationBarType.fixed, // Fixed

                onTap: (index) {
                  cubit.changeBottom(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'Order History',
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_3_outlined),

                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
