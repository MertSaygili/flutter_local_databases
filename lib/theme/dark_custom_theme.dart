import 'package:flutter/material.dart';

class CustomDarkTheme {
  late final ThemeData theme;

  CustomDarkTheme() {
    theme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'RobotoMono',
    );
  }
}
