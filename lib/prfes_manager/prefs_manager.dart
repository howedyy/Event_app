import 'package:event_app/core/resources/constant_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {

  static late SharedPreferences prefs;

  static Future<void> init()async{
    prefs = await SharedPreferences.getInstance();
  }

  static saveTheme(ThemeMode themeMode) async {
    String savedTheme = themeMode == ThemeMode.light ? "Light" : "Dark";
   // SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CacheConstant.themeKey, savedTheme);
  }



  static ThemeMode? getSavedTheme(){
   // SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString(CacheConstant.themeKey);

    if(savedTheme == "Light"){
      return ThemeMode.light;
    }
    if(savedTheme == "Dark"){
      return ThemeMode.dark;
    }
    return null;
  }

  static void saveLanguage(String language){
    prefs.setString(CacheConstant.languageKey, language);
  }

  static String? getSavedLanguage(){
    String? savedLanguage = prefs.getString(CacheConstant.languageKey);
    return savedLanguage;
  }

}