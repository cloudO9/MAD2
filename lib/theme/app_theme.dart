import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // Load theme preference from shared preferences
  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  // Toggle theme mode
  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = !_isDarkMode;
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }
}
