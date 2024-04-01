import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../theme/colors.dart';
import '../controller/home_controller.dart';

class LedIntensitySection extends StatefulWidget {
  const LedIntensitySection({super.key});

  @override
  State<LedIntensitySection> createState() => _LedIntensitySectionState();
}

class _LedIntensitySectionState extends State<LedIntensitySection> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = Get.find<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SleekCircularSlider(
        min: 0.0,
        max: 255.0,
        initialValue: _homeController.manualMode.value
            ? (_homeController.activeLed.value == "Led 1"
                ? _homeController.customLed1.value
                : _homeController.activeLedMode.value == "Led 2"
                    ? _homeController.customLed2.value
                    : _homeController.customLed3.value)
            : (_homeController.activeLedMode.value == "Low"
                ? _homeController.ledLowLevel.value
                : _homeController.activeLedMode.value == "Medium"
                    ? _homeController.ledMediumLevel.value
                    : _homeController.ledHighLevel.value),
        appearance: CircularSliderAppearance(
            size: 300,
            animationEnabled: true,
            startAngle: 180,
            angleRange: 180,
            customWidths: CustomSliderWidths(
                trackWidth: 8, progressBarWidth: 8, handlerSize: 8),
            customColors: CustomSliderColors(
                trackColor: Theme.of(context).primaryColorDark,
                progressBarColors: [
                  textWhite700,
                  gold,
                ],
                hideShadow: true,
                dynamicGradient: true,
                dotColor: textWhite700)),
        onChange: (value) {
          if (_homeController.manualMode.value) {
            if (_homeController.activeLed.value == "Led 1") {
              _homeController.setCustomLevels(led1: value);
            } else if (_homeController.activeLed.value == "Led 2") {
              _homeController.setCustomLevels(led2: value);
            } else if (_homeController.activeLed.value == "Led 3") {
              _homeController.setCustomLevels(led3: value);
            }
          } else {
            if (_homeController.activeLedMode.value == "Low") {
              _homeController.setIntensityLevels(low: value);
            } else if (_homeController.activeLedMode.value == "Medium") {
              _homeController.setIntensityLevels(medium: value);
            } else if (_homeController.activeLedMode.value == "High") {
              _homeController.setIntensityLevels(high: value);
            }
          }
        },
        innerWidget: (value) => Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.circle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text('Intensity', style: Theme.of(context).textTheme.bodySmall),

              const SizedBox(height: 24),

              //  controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  minus
                  GestureDetector(
                    onTap: () {
                      if (_homeController.manualMode.value) {
                        //  subtract overall value from either low, medium or high
                        if (_homeController.activeLed.value == "Led 1" &&
                            _homeController.customLed1.value > 5) {
                          _homeController.setCustomLevels(
                              led1: _homeController.customLed1.value - 5);
                        } else if (_homeController.activeLed.value == "Led 2" &&
                            _homeController.customLed2.value > 5) {
                          _homeController.setCustomLevels(
                              led2: _homeController.customLed2.value - 5);
                        } else if (_homeController.activeLed.value == "Led 3" &&
                            _homeController.customLed3.value > 5) {
                          _homeController.setCustomLevels(
                              led3: _homeController.customLed3.value - 5);
                        }
                      } else {
                        //  subtract overall value from either low, medium or high
                        if (_homeController.activeLedMode.value == "Low" &&
                            _homeController.ledLowLevel.value > 5) {
                          _homeController.setIntensityLevels(
                              low: _homeController.ledLowLevel.value - 5);
                        } else if (_homeController.activeLedMode.value ==
                                "Medium" &&
                            _homeController.ledMediumLevel.value > 5) {
                          _homeController.setIntensityLevels(
                              medium: _homeController.ledMediumLevel.value - 5);
                        } else if (_homeController.activeLedMode.value ==
                                "High" &&
                            _homeController.ledHighLevel.value > 5) {
                          _homeController.setIntensityLevels(
                              high: _homeController.ledHighLevel.value - 5);
                        }
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          )),
                      child: const Center(
                        child: Icon(
                          Icons.remove_rounded,
                          color: textWhite500,
                        ),
                      ),
                    ),
                  ),

                  //  percentage icon
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        )),
                    child: Text('${value.ceil()}',
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontWeight,
                            color: Theme.of(context).primaryColor)),
                  ),

                  // add icon
                  GestureDetector(
                    onTap: () {
                      if (_homeController.manualMode.value) {
                        //  subtract overall value from either low, medium or high
                        if (_homeController.activeLed.value == "Led 1" &&
                            _homeController.customLed1.value < 250) {
                          _homeController.setCustomLevels(
                              led1: _homeController.customLed1.value + 5);
                        } else if (_homeController.activeLed.value == "Led 2" &&
                            _homeController.customLed2.value < 250) {
                          _homeController.setCustomLevels(
                              led2: _homeController.customLed2.value + 5);
                        } else if (_homeController.activeLed.value == "Led 3" &&
                            _homeController.customLed3.value < 250) {
                          _homeController.setCustomLevels(
                              led3: _homeController.customLed3.value + 5);
                        }
                      } else {
                        //  add overall value from either low, medium or high
                        if (_homeController.activeLedMode.value == "Low" &&
                            _homeController.ledLowLevel.value < 250) {
                          _homeController.setIntensityLevels(
                              low: _homeController.ledLowLevel.value + 5);
                        } else if (_homeController.activeLedMode.value ==
                                "Medium" &&
                            _homeController.ledMediumLevel.value < 250) {
                          _homeController.setIntensityLevels(
                              medium: _homeController.ledMediumLevel.value + 5);
                        } else if (_homeController.activeLedMode.value ==
                                "High" &&
                            _homeController.ledHighLevel.value < 250) {
                          _homeController.setIntensityLevels(
                              high: _homeController.ledHighLevel.value + 5);
                        }
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          )),
                      child: const Center(
                        child: Icon(
                          Icons.add_rounded,
                          color: textWhite500,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
