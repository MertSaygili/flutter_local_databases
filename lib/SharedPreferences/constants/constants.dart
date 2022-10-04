import 'package:flutter/material.dart';

class FontSizes {
  // text sizes
  final double largeHeadline = 38;
  final double mediumHeadline = 28;
  final double largeText = 26;
  final double mediumText = 24;
  final double smallText = 18;

  // font sizes
  final double iconSize = 34;
}

class ColorItems {
  final Color colorTransparent = Colors.transparent;
  final Color colorBlack = Colors.black;
  final Color colorWhite = Colors.white;
  final Color colorGreen = Colors.green;
  final Color? colorGreen500 = Colors.green[500];
}

class IconItems {
  final Icon iconNoteadd = const Icon(Icons.note_add_outlined);
  final Icon iconSportBasketball = const Icon(Icons.sports_basketball_sharp);
  final Icon iconRemove = const Icon(Icons.remove);
}

class PaddingItems {
  final EdgeInsets paddingAppbarTextfield = const EdgeInsets.only(top: 15);
}
