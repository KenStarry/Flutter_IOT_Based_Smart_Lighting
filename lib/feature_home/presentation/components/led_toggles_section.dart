import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_pill.dart';
import 'package:smart_lighting/feature_home/presentation/components/open_bottom_sheet.dart';
import 'package:smart_lighting/feature_home/presentation/components/time_picker_bottom_sheet.dart';
import 'package:smart_lighting/feature_home/presentation/controller/home_controller.dart';

class LedTogglesSection extends StatefulWidget {
  const LedTogglesSection({super.key});

  @override
  State<LedTogglesSection> createState() => _LedTogglesSectionState();
}

class _LedTogglesSectionState extends State<LedTogglesSection> {
  late final HomeController _homeController;
  late final List<String> leds;

  @override
  void initState() {
    super.initState();
    leds = ["Led 1", "Led 2", "Led 3"];

    _homeController = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  timer mode
          LedPill(
              title: 'Timer',
              icon: Icon(Icons.timer_rounded),
              isActive: false,
              onTap: () async {

                openBottomSheet(content: TimePickerBottomSheet(), onComplete: (){});
              }),

          //  manual mode
          Obx(
            () => LedPill(
                title: 'Manual Mode',
                icon: Icon(Icons.auto_mode_rounded),
                isActive: _homeController.manualMode.value,
                onTap: () {
                  _homeController.setManualMode(
                      manualMode: !_homeController.manualMode.value);
                }),
          )
        ],
      ),
    );
  }
}
