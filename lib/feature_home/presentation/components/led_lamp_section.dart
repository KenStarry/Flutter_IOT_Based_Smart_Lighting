import 'package:flutter/material.dart';

class LedLampSection extends StatefulWidget {
  const LedLampSection({super.key});

  @override
  State<LedLampSection> createState() => _LedLampSectionState();
}

class _LedLampSectionState extends State<LedLampSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
    );
  }
}
