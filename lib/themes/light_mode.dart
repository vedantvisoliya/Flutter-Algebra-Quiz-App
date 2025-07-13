import 'package:flutter/material.dart';
import 'package:math_quiz_game/themes/app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: AppColors.backgroundLightMode,
    primary: AppColors.buttonLightMode,
    secondary: AppColors.buttonTextLightMode,
    tertiary: Colors.white,
    inversePrimary: const Color.fromARGB(255, 130, 130, 130),
    inverseSurface: const Color.fromARGB(255, 100, 100, 100),
  ),
);