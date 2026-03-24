import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; 

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 45, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          
          style: AppTextStyles.button, 
        ),
      ),
    );
  }
} 