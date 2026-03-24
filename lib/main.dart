import 'package:flutter/material.dart';

import 'package:task1/pages/onboarding.dart';
import 'theme/app_theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: AppTheme.light,
  home: const Onboarding(),
);
  }
}