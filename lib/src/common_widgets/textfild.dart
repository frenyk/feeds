import 'package:flutter/material.dart';

TextField ReuseTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: text,
        hintText: text,
        border: OutlineInputBorder()),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
