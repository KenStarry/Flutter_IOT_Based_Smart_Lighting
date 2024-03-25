import 'package:flutter/material.dart';

class LedPill extends StatelessWidget {
  final String title;
  final bool isActive;

  const LedPill({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.white),
      child: Center(
        child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
