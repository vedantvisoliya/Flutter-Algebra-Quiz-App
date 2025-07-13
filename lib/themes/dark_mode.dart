import 'package:flutter/material.dart';
import 'package:math_quiz_game/themes/app_colors.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: AppColors.backgroundDarkMode,
    primary: AppColors.buttonDarkMode,
    secondary: AppColors.buttonTextDarkMode,
    inversePrimary: AppColors.levelTextDarkMode,
    inverseSurface: const Color.fromARGB(255, 150, 150, 150),
  ),
);
