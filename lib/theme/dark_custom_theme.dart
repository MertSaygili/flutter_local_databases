import 'package:flutter/material.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class CustomDarkTheme {
  late final ThemeData theme;
  late final FontSizes _fontSizes;
  late final ColorItems _colors;
  late final BorderRaidusItems _borderRaidusItems;
  late final PaddingItems _paddingItems;

  CustomDarkTheme() {
    // initiliaze
    _fontSizes = FontSizes();
    _colors = ColorItems();
    _borderRaidusItems = BorderRaidusItems();
    _paddingItems = PaddingItems();

    theme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'RobotoMono',
      appBarTheme: _appbarTheme(),
      textTheme: _textTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(350, 50),
        maximumSize: const Size(400, 50),
        backgroundColor: _colors.colorPurple,
        foregroundColor: _colors.colorWhite,
        shape: RoundedRectangleBorder(
          borderRadius: _borderRaidusItems.borderRadiusButton,
        ),
      ),
    );
  }

  TextTheme _textTheme() {
    return TextTheme(
      titleMedium: TextStyle(
        fontSize: _fontSizes.titleMedium,
        fontWeight: FontWeight.w300,
        color: _colors.colorWhite,
      ),
      labelMedium: TextStyle(
        fontSize: _fontSizes.buttonMedium,
        color: _colors.colorWhite,
        fontWeight: FontWeight.w300,
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
