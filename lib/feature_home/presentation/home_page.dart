import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_lighting/feature_home/presentation/components/lamp.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_intensity_section.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_lamp_section.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_toggles_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                          child: CustomPaint(
                            size: Size(200, (200 * 1).toDouble()),
                            painter: const Lamp(bulbOn: true),
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
