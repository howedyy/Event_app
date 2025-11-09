import 'package:event_app/prfes_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier{

  ThemeMode currentTheme =   PrefsManager.getSavedTheme()?? ThemeMode.light;
  String currentLanguage = PrefsManager.getSavedLanguage() ?? "en";
  void changeAppTheme(ThemeMode newTheme){
    if(currentTheme == newTheme) return;
    currentTheme = newTheme;
    PrefsManager.saveTheme(currentTheme);
    notifyListeners();
  }

bool get isDark => currentTheme == ThemeMode.dark;

  void changeAppLanguage(String newLanguage){
    if(currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    PrefsManager.saveLanguage(currentLanguage);
    notifyListeners();
  }

  bool get isEnglish=> currentLanguage == "en";
}