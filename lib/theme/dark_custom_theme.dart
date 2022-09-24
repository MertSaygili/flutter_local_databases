import 'package:flutter/material.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class CustomDarkTheme {
  late final ThemeData theme;
  late final FontSizes _fontSizes;
  late final ColorItems _colors;

  CustomDarkTheme() {
    // initiliaze
    _fontSizes = FontSizes();
    _colors = ColorItems();

    theme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'RobotoMono',
      appBarTheme: _appbarTheme(),
      textTheme: _textTheme(),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      titleMedium: TextStyle(
        fontSize: _fontSizes.titleMedium,
      ),
    );
  }

  AppBarTheme _appbarTheme() {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: _colors.colorTransparet,
      elevation: 0,
    );
  }
}
