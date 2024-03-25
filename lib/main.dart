import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_lighting/feature_home/di/controllers_di.dart';
import 'package:smart_lighting/feature_home/presentation/home_page.dart';
import 'package:smart_lighting/theme/my_theme.dart';

void main() {

  invokeControllers();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme,
      darkTheme: MyTheme.darkTheme,
    );
  }
}

