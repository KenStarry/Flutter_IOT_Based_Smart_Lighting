import 'package:flutter/material.dart';
import 'package:smart_lighting/theme/colors.dart';

class LedPill extends StatelessWidget {
  final String title;
  final bool isActive;
  final Icon? icon;
  final VoidCallback onTap;

  const LedPill(
      {super.key,
      required this.title,
      required this.isActive,
      this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color:
                  isActive ? Theme.of(context).primaryColor : Theme.of(context).primaryColorDark,
              border: isActive
                  ? null
                  : Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    )),
          child: Center(
            child: Row(
              children: [
                icon == null
                    ? const SizedBox.shrink()
                    : Row(
                        children: [
                          icon!,
                          const SizedBox(
                            width: 8,
                          )
                        ],
                      ),
                Text(title,
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.bodyMedium!.fontWeight,
                        color: isActive
                            ? Colors.black
                            : Theme.of(context).textTheme.bodyMedium!.color)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
