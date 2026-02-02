import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color gold = Color(0xFFC2B067);

  // Space Mode (OLED)
  static const Color spaceBackground = Color(0xFF000000);
  static const Color spaceSurface = Color(0xFF000000);

  // Moon Mode (Modern Dark)
  static const Color moonBackground = Color(0xFF1E1E1E);
  static const Color moonSurface = Color(0xFF2A2A2A);

  static const LinearGradient goldFadeGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Colors.transparent,
      gold,
      gold,
      Colors.transparent,
      Colors.transparent,
    ],
    stops: [0.0, 0.05, 0.2, 0.8, 0.95, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

class AppThemes {
  static ThemeData spaceTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.spaceBackground,
    canvasColor: AppColors.spaceBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.gold,
      onPrimary: Colors.black,
      secondary: AppColors.gold,
      onSecondary: Colors.black,
      surface: AppColors.spaceSurface,
      onSurface: AppColors.gold,
      outline: AppColors.gold,
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
      bodySmall: GoogleFonts.sourceSans3(
        color: AppColors.gold.withAlpha(180),
        fontSize: 12,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.spaceSurface,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.gold, width: 1.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.spaceSurface,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gold, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gold, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: const TextStyle(color: AppColors.gold),
      hintStyle: const TextStyle(color: Colors.white24),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.spaceSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.gold, width: 1.0),
      ),
      titleTextStyle: GoogleFonts.cinzel(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: GoogleFonts.sourceSans3(color: Colors.white70),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
  );

  static ThemeData moonTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.moonBackground,
    canvasColor: AppColors.moonBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.gold,
      onPrimary: Colors.black,
      secondary: AppColors.gold,
      onSecondary: Colors.black,
      surface: AppColors.moonSurface,
      onSurface: AppColors.gold,
      outline: AppColors.gold,
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
      bodySmall: GoogleFonts.sourceSans3(
        color: AppColors.gold.withAlpha(180),
        fontSize: 12,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.moonSurface,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.gold, width: 1.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.moonSurface,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gold, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.gold, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: const TextStyle(color: AppColors.gold),
      hintStyle: const TextStyle(color: Colors.white24),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.moonSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.gold, width: 1.0),
      ),
      titleTextStyle: GoogleFonts.cinzel(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: GoogleFonts.sourceSans3(color: Colors.white70),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.gold,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
  );
}
