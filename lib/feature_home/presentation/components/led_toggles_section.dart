import 'package:flutter/material.dart';
import 'package:smart_lighting/feature_home/presentation/components/led_pill.dart';

class LedTogglesSection extends StatefulWidget {
  const LedTogglesSection({super.key});

  @override
  State<LedTogglesSection> createState() => _LedTogglesSectionState();
}

class _LedTogglesSectionState extends State<LedTogglesSection> {
  late final List<String> leds;

  @override
  void initState() {
    super.initState();
    leds = ["Led 1", "Led 2", "Led 3"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: leds
            .map((led) => LedPill(title: led, isActive: false, onTap: () {}))
            .toList(),
      ),
    );
  }
}
