import 'package:flutter/material.dart';
import '../SharedPreferences/constants/constants.dart';

class CustomLightTheme {
  late final ThemeData theme;
  late final FontSizes _fontSizes;
  late final ColorItems _colors;

  CustomLightTheme() {
    _fontSizes = FontSizes();
    _colors = ColorItems();

    theme = ThemeData(
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: _colors.colorBlack,
        size: _fontSizes.iconSize,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: _fontSizes.largeHeadline,
          color: _colors.colorBlack,
          letterSpacing: 0.8,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontSize: _fontSizes.mediumHeadline,
          color: _colors.colorBlack,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
