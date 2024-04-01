import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_lighting/feature_home/presentation/components/lamp.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_intensity_section.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_lamp_section.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_toggles_section.dart';

import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          statusBarColor: Theme.of(context).scaffoldBackgroundColor),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    //  lamp
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 54.0),
                          child: Obx(
                            () => CustomPaint(
                              size: Size(200, (200 * 1).toDouble()),
                              painter:
                                  Lamp(bulbOn: _homeController.bulbOn.value),
                            ),
                          )),
                    ),
                    const Column(
                      children: [
                        //  toggles
                        LedTogglesSection(),

                        //  lamp
                        Expanded(child: LedLampSection()),
                      ],
                    )
                  ],
                ),
              ),

              //  slider
              Container(
                  width: double.infinity,
                  height: 180,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Stack(
                    children: [
                      Positioned.fill(
                          bottom: -150,
                          child: Align(
                              alignment: Alignment.center,
                              child: LedIntensitySection()))
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
