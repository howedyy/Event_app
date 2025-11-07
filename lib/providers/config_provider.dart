import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;
  String currentLanguage = "en";
  void changeAppTheme(ThemeMode newTheme){
    currentTheme = newTheme;
    notifyListeners();
  }

bool get isDark => currentTheme == ThemeMode.dark;

  void changeAppLanguage(String newLanguage){
    if(currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  bool get isEnglish=> currentLanguage == "en";
}