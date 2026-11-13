import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFF090D16);
  static const surface = Color(0xFF111827);
  static const surfaceElevated = Color(0xFF182235);
  static const border = Color(0xFF263247);
  static const primary = Color(0xFF7C9CFF);
  static const cyan = Color(0xFF54D6D0);
  static const muted = Color(0xFF91A0B8);
  static const success = Color(0xFF46D6A0);
  static const warning = Color(0xFFFFC46B);
}

abstract final class AppTheme {
  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      surface: AppColors.surface,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.cyan,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Vazirmatn',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      dividerColor: AppColors.border,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}
