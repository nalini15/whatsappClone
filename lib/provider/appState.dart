import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { DARK, LIGHT }

class AppStates extends ChangeNotifier {
  bool isDarkTheme = false;
  String dark = '';
  String light = '';

  AppStates() {
    getTheme().then((type) {
      isDarkTheme = type == ThemeType.DARK;
      notifyListeners();
    });
  }

  Future<ThemeType> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isDarkTheme = preferences.getBool('isDark') ?? false;
    return isDarkTheme ? ThemeType.DARK : ThemeType.LIGHT;
  }

  ThemeType get theme => isDarkTheme ? ThemeType.DARK : ThemeType.LIGHT;
  set theme(ThemeType type) => setTheme(type);

  void setTheme(ThemeType type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isDarkTheme = type == ThemeType.DARK;
    bool status = await preferences.setBool('isDark', isDarkTheme);
    if (status) notifyListeners();
  }
}
