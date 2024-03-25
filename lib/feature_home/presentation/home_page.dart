import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_bulb.dart';

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
              Container(
                width: double.infinity,
              )

              //  lamp

              //  slider
            ],
          ),
        )),
      ),
    );
  }
}
