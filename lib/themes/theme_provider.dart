import 'package:flutter/material.dart';
import 'package:math_quiz_game/themes/dark_mode.dart';
import 'package:math_quiz_game/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // initializing the theme
  ThemeData _themeData = lightMode;

  // getter
  ThemeData get themeData => _themeData;

  // is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  // toggle mode
  void toggleTheme() {
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else {
      themeData = lightMode;
    }
  }
}