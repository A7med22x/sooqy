import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarThemeData(
      backgroundColor: ColorManager.white,
      foregroundColor: ColorManager.green,
      centerTitle: true,
      titleTextStyle: getBoldStyle(color: ColorManager.green, fontSize: 20),
    ),
    scaffoldBackgroundColor: ColorManager.white,
  );

  static ThemeData darkTheme = ThemeData();
}
