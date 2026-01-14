import 'package:flutter/material.dart';
import 'package:hungry_app/core/services/service_locater.dart';
import 'package:hungry_app/hungry_app.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const HungryApp());
}

