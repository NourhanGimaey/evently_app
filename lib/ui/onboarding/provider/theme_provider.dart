import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(ThemeMode theme) {
    theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _themeMode = theme;
    notifyListeners();
  }
}
