import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLangagueProvider extends ChangeNotifier {
  String local = 'en';


  AppLangagueProvider() {
    getInitialLang();
  }

  void getInitialLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    local = prefs.getString('lang') ?? 'en';
    notifyListeners();
  }

  void changeLang(String newlang) async {
    if (local == newlang) return;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    local = newlang;
    await prefs.setString('lang', local);
    notifyListeners();
  }
}