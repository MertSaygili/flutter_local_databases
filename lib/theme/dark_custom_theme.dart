import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/constants/constanst.dart';

class CustomDarkTheme {
  late final ThemeData theme;
  late final FontSizes _fontSizes;
  late final ColorItems _colors;
  late final BorderRaidusItems _borderRaidusItems;

  CustomDarkTheme() {
    // initiliaze
    _fontSizes = FontSizes();
    _colors = ColorItems();
    _borderRaidusItems = BorderRaidusItems();

    theme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'RobotoMono',
      appBarTheme: _appbarTheme(),
      textTheme: _textTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      floatingActionButtonTheme: _floatingActionButtonTheme(),
      iconTheme: _iconThemeData(),
    );
  }

  IconThemeData _iconThemeData() {
    return IconThemeData(
      color: _colors.colorWhite,
      size: _fontSizes.iconSizeMedium,
    );
  }

  FloatingActionButtonThemeData _floatingActionButtonTheme() {
    return FloatingActionButtonThemeData(
      backgroundColor: _colors.colorPurple,
      foregroundColor: _colors.colorWhite,
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
      headlineMedium: TextStyle(
        fontSize: _fontSizes.headlineMedium,
        fontWeight: FontWeight.w600,
        color: _colors.colorWhite,
        letterSpacing: 1,
        wordSpacing: -1,
      ),
      labelLarge: TextStyle(
        fontSize: _fontSizes.labelLarge,
        color: _colors.colorWhite,
        fontWeight: FontWeight.w300,
        letterSpacing: 1,
      ),
      labelMedium: TextStyle(
        fontSize: _fontSizes.buttonMedium,
        color: _colors.colorWhite,
        fontWeight: FontWeight.w300,
      ),
      labelSmall: TextStyle(
        fontSize: _fontSizes.labelSmall,
        color: _colors.colorGray,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
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
