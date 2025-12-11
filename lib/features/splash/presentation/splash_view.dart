import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/core/utils/app_strings.dart';
import 'package:hungry_app/core/utils/text_style.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController _imageController;

  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  late Animation<double> _imageOpacity;
  late Animation<Offset> _imageSlide;

  @override
  void initState() {
    super.initState();

    // Text animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _textOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeIn));
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    // Image animation (delayed)
    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _imageOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _imageController, curve: Curves.easeIn));
    _imageSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _imageController, curve: Curves.easeOut));

    // Start text animation
    _textController.forward();

    // Start image animation slightly after text
    Future.delayed(const Duration(milliseconds: 500), () {
      _imageController.forward();
    });

    Timer(const Duration(seconds: 3), () {});
  }

  @override
  void dispose() {
    _textController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200.h),

              // Animated Text
              SlideTransition(
                position: _textSlide,
                child: FadeTransition(
                  opacity: _textOpacity,
                  child: Text(
                    AppStrings.appName,
                    style: AppStyles.permanentStyleText(fontSize: 55),
                  ),
                ),
              ),

              Spacer(),
              // Animated Image
              SlideTransition(
                position: _imageSlide,
                child: FadeTransition(
                  opacity: _imageOpacity,
                  child: Image.asset(
                    'assets/images/splash.png',
                    width: 1.sw,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
