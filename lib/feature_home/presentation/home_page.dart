import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_bulb.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_intensity_section.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_lamp_section.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_toggles_section.dart';

import 'components/lamp.dart';
import 'components/lamp_hanger_rope.dart';
import 'components/lamp_switch.dart';
import 'components/lamp_switch_rope.dart';

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
              //  toggles
              const LedTogglesSection(),

              //  lamp
              const Expanded(child: LedLampSection()),

              //  slider
              Container(
                  width: double.infinity,
                  height: 180,
                  color: Theme.of(context).scaffoldBackgroundColor         ,
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
