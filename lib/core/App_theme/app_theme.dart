import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[100],
    primaryColor: Colors.blueAccent,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.blue.shade400,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.black,
      onSurface: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: Colors.blue,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.blue.shade800,
      onPrimary: Colors.blue.shade400,
      secondary: Colors.black,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      surface: Colors.black,
      onSurface: Colors.grey.shade300,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 1,
    ),
  );
}
