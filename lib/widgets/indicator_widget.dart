import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  final double width;
  final Color color;

  const IndicatorWidget({
    super.key,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4), 
      width: width,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1000), 
      ),
    );
  }
}