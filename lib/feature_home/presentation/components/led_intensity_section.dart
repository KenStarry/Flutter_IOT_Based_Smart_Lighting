import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../theme/colors.dart';

class LedIntensitySection extends StatefulWidget {
  const LedIntensitySection({super.key});

  @override
  State<LedIntensitySection> createState() => _LedIntensitySectionState();
}

class _LedIntensitySectionState extends State<LedIntensitySection> {
  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: 0.0,
      max: 255.0,
      initialValue: 255.0,
      appearance: CircularSliderAppearance(
          size: 250,
          animationEnabled: true,
          startAngle: 180,
          angleRange: 180,
          customWidths: CustomSliderWidths(
              trackWidth: 8,
              progressBarWidth: 8,
              handlerSize: 8),
          customColors: CustomSliderColors(
              trackColor:
              Theme.of(context).scaffoldBackgroundColor,
              progressBarColors: [
                textWhite700,
                gold,
              ],
              hideShadow: true,
              dynamicGradient: true,
              dotColor: textWhite700)),
      onChange: (value){
        print("VALUEEE : ${value}");
      },
      innerWidget: (value) => Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color:
            Theme.of(context).scaffoldBackgroundColor,
            shape: BoxShape.circle),
        child: Center(

        ),
      ),
    );
  }
}
