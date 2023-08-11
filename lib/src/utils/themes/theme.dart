import 'package:flutter/material.dart';
import 'package:login_app/src/utils/themes/text_theme.dart';

class TAppTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.DarkTextTheme,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));
  // ignore: non_constant_identifier_names
  static ThemeData DarkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.DarkTextTheme,
  );
}
