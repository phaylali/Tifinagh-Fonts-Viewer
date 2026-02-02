import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color gold = Color(0xFFC2B067);

  // Space Mode (OLED)
  static const Color spaceBackground = Color(0xFF000000);
  static const Color spaceSurface = Color(0xFF121212);

  // Moon Mode (Modern Dark)
  static const Color moonBackground = Color(0xFF1E1E1E);
  static const Color moonSurface = Color(0xFF2A2A2A);
}

class AppThemes {
  static ThemeData spaceTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.spaceBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.gold,
      surface: AppColors.spaceSurface,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.cinzel(
        color: AppColors.gold,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      displayMedium: GoogleFonts.cinzel(
        color: AppColors.gold,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      bodyLarge: GoogleFonts.sourceSans3(color: Colors.white, fontSize: 16),
      bodyMedium: GoogleFonts.sourceSans3(color: Colors.white70, fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData moonTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.moonBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.gold,
      surface: AppColors.moonSurface,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.cinzel(
        color: AppColors.gold,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      displayMedium: GoogleFonts.cinzel(
        color: AppColors.gold,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      bodyLarge: GoogleFonts.sourceSans3(color: Colors.white, fontSize: 16),
      bodyMedium: GoogleFonts.sourceSans3(color: Colors.white70, fontSize: 14),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
