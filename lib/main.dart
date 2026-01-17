import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungry_app/core/services/service_locater.dart';
import 'package:hungry_app/core/utils/app_colors.dart';
import 'package:hungry_app/hungry_app.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setSystemUIOverlayStyle(
  SystemUiOverlayStyle(
    statusBarColor: AppColors.whiteColor, 
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
);

  runApp(const HungryApp());
}

