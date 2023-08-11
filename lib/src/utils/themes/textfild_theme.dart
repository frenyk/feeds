import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: Colors.black,
    floatingLabelStyle: TextStyle(color: Colors.yellow),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Colors.yellow),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: Colors.white,
    floatingLabelStyle: TextStyle(color: Colors.white),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Colors.blue),
    ),
  );
}
