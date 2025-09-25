import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  AppThemeProvider extends ChangeNotifier{
  ThemeMode appTheme=ThemeMode.light;
  AppThemeProvider(){
    getInitialTheme();
  }
  getInitialTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    appTheme=prefs.getString('theme')==ThemeMode.light.toString()?ThemeMode.light:ThemeMode.dark;

    notifyListeners();
  }
    Future<void> changetheme(ThemeMode newtheme) async {
      if(appTheme==newtheme) return;
      appTheme=newtheme;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme', appTheme.toString());
      notifyListeners();
    }
    }

