import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  void changeTheme(newMode) {
    if (appTheme == newMode) {
      newMode = ThemeMode.light;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  Locale appLanguage = Locale('ar');

  void changeLanguage(language) {
    if (appLanguage == language) {
      return;
    }
    appLanguage = language;
    notifyListeners();
  }

  bool isEnglish() {
    return appLanguage == Locale('en');
  }
}
