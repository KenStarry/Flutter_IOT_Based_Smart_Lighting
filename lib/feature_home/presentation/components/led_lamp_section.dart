import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:slider_button/slider_button.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_mode_card.dart';
import 'package:smart_lighting/feature_home/presentation/controller/home_controller.dart';
import 'package:smart_lighting/theme/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LedLampSection extends StatefulWidget {
  const LedLampSection({super.key});

  @override
  State<LedLampSection> createState() => _LedLampSectionState();
}

class _LedLampSectionState extends State<LedLampSection> {
  late final HomeController _homeController;
  final ledModes = <Map<String, dynamic>>[
    {"title": "Low", "icon": 'assets/images/bulb_low.svg'},
    {"title": "Medium", "icon": 'assets/images/bulb_medium.svg'},
    {"title": "High", "icon": 'assets/images/bulb_high.svg'},
  ];

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  switch
          RotatedBox(
            quarterTurns: 3,
            child: ToggleSwitch(
              minHeight: 50,
              minWidth: 60,
              radiusStyle: true,
              cornerRadius: 100,
              animationDuration: 3000,
              inactiveBgColor: Theme.of(context).primaryColorDark,
              activeBgColor: [Theme.of(context).primaryColor],
              activeFgColor: Theme.of(context).scaffoldBackgroundColor,
              totalSwitches: 2,
              icons: const [
                Icons.power_settings_new_rounded,
                Icons.power_off_rounded,
              ],
              onToggle: (index) {
                //  0 - on, 1 - off
              },
            ),
          ),

          const SizedBox(height: 16),

          //  led modes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ledModes
                .map((mode) => Obx(
                      () => LedModeCard(
                          title: mode['title'],
                          icon: mode['icon'],
                          active:
                              _homeController.activeLedMode == mode['title'],
                          onTap: () {
                            _homeController.setActiveLedMode(
                                ledMode: mode['title']);
                          }),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
