import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routes/router_names.dart';
import 'package:hungry_app/core/services/service_locater.dart';
import 'package:hungry_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:hungry_app/features/auth/presentation/views/login_view.dart';
import 'package:hungry_app/features/auth/presentation/views/register_view.dart';
import 'package:hungry_app/features/home/presentation/views/home_view.dart';
import 'package:hungry_app/features/root/presentation/views/bottom_navbar_view.dart';
import 'package:hungry_app/features/splash/presentation/splash_view.dart';

final GoRouter router = GoRouter(
  initialLocation: RouterNames.splash,
  routes: [
    GoRoute(
      path: RouterNames.splash, 
      builder: (context,state) => const SplashView()
      ),


    GoRoute(
      path: RouterNames.login,
      builder: (context,state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: RouterNames.register,
      builder: (context,state) => BlocProvider(
        create: (context) => sl<AuthCubit>(),
        child: const RegisterView(),
      ),
    ),
    
    GoRoute(path: RouterNames.home, builder: (context,state) => const HomeView()),
    GoRoute(path: RouterNames.bottomNavBar, builder: (context,state) => const BottomNavBarView()),
  ],

  
);
