import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_lighting/feature_home/di/controllers_di.dart';
import 'package:smart_lighting/feature_home/presentation/home_page.dart';
import 'package:smart_lighting/firebase_options.dart';
import 'package:smart_lighting/theme/my_theme.dart';

import 'core/timer_isolates.dart';
import 'feature_home/presentation/controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  invokeControllers();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();

    initializeTimerIsolate();
  }

  void initializeTimerIsolate() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(trackCurrentTimeIsolate, receivePort.sendPort);

    receivePort.listen((message) {
      final currentDate = message as DateTime;

      _homeController.updateCurrentDateTime(date: currentDate);
    });
  }

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
