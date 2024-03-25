import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_lighting/feature_home/di/controllers_di.dart';
import 'package:smart_lighting/feature_home/presentation/home_page.dart';
import 'package:smart_lighting/firebase_options.dart';
import 'package:smart_lighting/theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
