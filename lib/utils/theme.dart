import 'package:flutter/material.dart';
import 'package:movie_app/utils/color_manager.dart';




final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.green,
  colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorManager.primary,
      onPrimary: ColorManager.primary,
      secondary: ColorManager.textGray,
      onSecondary: ColorManager.inputColor,
      error: Colors.red,
      onError: Colors.red,
      background: ColorManager.backGround,
      onBackground: ColorManager.backGround,
      surface: ColorManager.iconGray,
      onSurface: Colors.black12,
    ),
);
