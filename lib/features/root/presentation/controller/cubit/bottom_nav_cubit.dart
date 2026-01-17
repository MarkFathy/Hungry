import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/auth/presentation/views/login_view.dart';
import 'package:hungry_app/features/auth/presentation/views/register_view.dart';
import 'package:hungry_app/features/cart/presentation/views/cart_view.dart';
import 'package:hungry_app/features/home/presentation/views/home_view.dart';
part 'bottom_nav_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarStates> {
  BottomNavBarCubit() : super(HomeInitial());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomNavScreens = [
    const HomeView(),
    const CartView(),
    const RegisterView(),
    // const BookingView(),
    // const SettingsView(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomState());
  }
}
