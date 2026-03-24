import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const AppCircleButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 16,
          color: primary,
        ),
      ),
    );
  }
}