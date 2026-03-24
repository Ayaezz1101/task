import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF4D7881);
  static const textDark = Color(0xFF1F2937);
  static const textLight = Color(0xFF6B7280);
  static const border = Color(0xFFE5E7EB);
  static const fieldBg = Color(0xFFF9FAFB);
  static const indicatorInactive = Color(0xFFEDEEEF);
}

class AppTextStyles {
  static const title = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const body = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 14,
    color: AppColors.textLight,
  );

  static const button = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}

class AppTheme {
  static ThemeData light = ThemeData(
    fontFamily: 'Rubik',

    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 0,
        textStyle: AppTextStyles.button,
      ),
    ),

   inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.fieldBg,
      
      
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14, 
        horizontal: 20,
      ),

     
      hintStyle: const TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF757575), 
        height: 1.4, 
        letterSpacing: 0.2,
      ),


      prefixIconColor: const Color(0xFF757575),
      suffixIconColor: const Color(0xFF757575),
      

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(128),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(128),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(128),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    ), );
}