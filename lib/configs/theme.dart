import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const secondary = Color(0xFF3277D8);
  static const accent = Color(0xFF323643);
  static const textDark = Color(0xFF323643);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF606470);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFFFFFFF);
  static const cardDark = Color(0xFF303334);
  static const progressIndicatorDark = Color(0xFFF9FAFE);
  static const progressIndicatorLight = Color(0xFF303334);
  static const ratingStarColor = Color(0xFFFFBA00);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: AppColors.textDark,
        ),
        backgroundColor: _LightColors.background,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.progressIndicatorLight,
        ),
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textDark,
          elevation: 0,
        ),
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.secondary,
          secondary: accentColor,
        ),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: AppColors.textLigth,
        ),
        backgroundColor: _DarkColors.background,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.progressIndicatorDark,
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.textLigth,
          elevation: 0,
        ),
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLigth),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.secondary,
          secondary: accentColor,
        ),
      );
}
