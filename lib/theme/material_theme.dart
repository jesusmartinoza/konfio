import 'package:flutter/material.dart';

class MaterialTheme {
  static const lightBackground = Color(0xFFF8F8F8);
  static const lightCardColor = Colors.white;
  static const lightTextColor = Color(0xFF333333);
  static const defaultRadius = 12.0;

  static ThemeData light() {
    final colorScheme = const ColorScheme.light().copyWith(
        primary: lightTextColor,
        surface: lightBackground,
        surfaceTint: Colors.white,
        error: const Color(0xFFD50000), // Deep red for error
        onPrimary: Colors.white,
        onPrimaryContainer: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
        onSurface: Colors.black,
        onError: Colors.white,
        primaryContainer: lightBackground);
    return ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        disabledColor: Colors.grey.shade300,
        unselectedWidgetColor: const Color(0xFFEFEFEF),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        cardColor: lightCardColor,
        cardTheme: CardTheme(
          color: lightCardColor,
          shadowColor: Colors.black26,
          clipBehavior: Clip.hardEdge,
        ),
        textTheme: TextTheme(
            titleLarge: TextStyle(color: lightTextColor),
            bodyMedium: TextStyle(color: Color(0xFF666666))));
  }
}
