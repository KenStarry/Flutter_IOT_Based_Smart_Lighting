import 'package:flutter/material.dart';

class LampSwitch extends StatelessWidget {
  final Function onTap;
  final bool isSwitchOn;
  final Color toggleOnColor, toggleOffColor, color;
  final double screenWidth, screenHeight;
  final Duration animationDuration;

  const LampSwitch({
    super.key,
    required this.onTap,
    required this.isSwitchOn,
    required this.screenWidth,
    required this.screenHeight,
    required this.animationDuration,
    required this.toggleOnColor,
    required this.toggleOffColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.31,
      width: 30,
      left: screenWidth * 0.5 - 15,
      child: GestureDetector(
        onTap: (){},
        child: Stack(
          children: [
            AnimatedContainer(
              duration: animationDuration,
              width: 30,
              height: 70,
              decoration: BoxDecoration(
                color: isSwitchOn ? Colors.red : Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            AnimatedPositioned(
              duration: animationDuration,
              left: 0,
              right: 0,
              top: isSwitchOn ? 42 : 4,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}