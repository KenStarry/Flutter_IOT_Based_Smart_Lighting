import 'package:flutter/material.dart';
import 'package:smart_lighting/theme/colors.dart';

class LedModeCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool active;
  final VoidCallback onTap;

  const LedModeCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.active,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  container for the power modes
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: active ? gold : Theme.of(context).primaryColorDark,
                border: active
                    ? null
                    : Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      )),
            child: Center(
              child: icon,
            ),
          ),

          Text(title, style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}
