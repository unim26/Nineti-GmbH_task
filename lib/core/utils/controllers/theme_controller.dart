import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  //variables
  ThemeMode _themeMode = ThemeMode.light;
  bool _isDarkMode = false;

  //getter
  ThemeMode get themeMode => _themeMode;
  bool get isdarkMode => _isDarkMode;

  //method to toogle theme mode
  void toggleThemeMode() {
    _isDarkMode = !_isDarkMode;

    //check for theme mode
    if (_isDarkMode) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
