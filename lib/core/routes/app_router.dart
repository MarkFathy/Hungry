import 'package:go_router/go_router.dart';
import 'package:hungry_app/core/routes/router_names.dart';
import 'package:hungry_app/features/auth/presentation/views/login_view.dart';
import 'package:hungry_app/features/auth/presentation/views/signup_view.dart';
import 'package:hungry_app/features/home/presentation/views/home_view.dart';
import 'package:hungry_app/features/root/presentation/views/bottom_navbar_view.dart';
import 'package:hungry_app/features/splash/presentation/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.splash,
      builder: (context, state) => const SplashView(),
    ),
      GoRoute(
      path: RouterNames.login,
      builder: (context, state) => const LoginView(),
    ),

    GoRoute(
      path: RouterNames.signup,
      builder: (context, state) =>const SignupView(),
  
   ),

    GoRoute(
      path: RouterNames.bottomNavBar,
      builder: (context, state) => const BottomNavBarView(),
    ),

    GoRoute(
      path: RouterNames.home,
      builder: (context, state) =>
          const HomeView(),
    ),
    
    

    // GoRoute(
    //   path: RouterNames.login,
    //   builder: (context, state) =>
    //       BlocProvider(
    //         create: (context) => getIt<AuthCubit>(),
    //         child: const LoginView(),
    //       ),
    // ),
    
    
    // GoRoute(
    //   path: RouterNames.forgetPassword,
    //   builder: (context, state) =>
    //       BlocProvider(
    //         create: (context) => getIt<AuthCubit>(),
    //         child: VerificationPage(),
    //       ),
    // ),
    // GoRoute(
    //   path: RouterNames.enterYourEmail,
    //   builder: (context, state) =>
    //       BlocProvider(
    //         create: (context) => getIt<AuthCubit>(),
    //         child: const EnterYourEmailView(),
    //       ),
    // ),
    // GoRoute(
    //   path: RouterNames.changePassword,
    //   builder: (context, state) => const ChangePassword(),
    // ),
    // GoRoute(
    //   path: RouterNames.booking,
    //   builder: (context, state) => const BookingView(),
    // ),
   

    // GoRoute(
    //   path: RouterNames.personalInfoView,
    //   builder: (context, state) => const PersonalInfoView(),
    // ),
    // GoRoute(
    //   path: RouterNames.changePasswordView,
    //   builder: (context, state) => const ChangePasswordView(),
    // ),
    // GoRoute(
    //   path: RouterNames.bookingTime,
    //   builder: (context, state) => const BookingTimeView(),
    // ),
    // GoRoute(
    //   path: RouterNames.reportProblemView,
    //   builder: (context, state) => const ReportAProblemView(),
    // ),
    // GoRoute(
    //   path: RouterNames.doctorProfileInfo,
    //   builder: (context, state) {
    //     final doctor = state.extra as DoctorModel?;
    //     if (doctor == null) {
    //       return const Scaffold(
    //         body: Center(child: Text('No doctor data available')),
    //       );
    //     }
    //     return DoctorProfileInfoView(doctor: doctor);
    //   },
    // ),
  ],
);

/*

GoRoute(
      path: RouterNames.doctorProfileInfo,
      builder: (context, state) {
        final DoctorModel doctor = state.extra as DoctorModel;
        return DoctorProfileViewBody(doctor: doctor);
      },
    ),
 */
