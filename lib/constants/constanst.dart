import 'package:flutter/material.dart';

class FontSizes {
  final double titleMedium = 24;
  final double buttonMedium = 18;
  final double iconSizeMedium = 28;
  final double headlineMedium = 16;
}

class ColorItems {
  final Color colorTransparet = Colors.transparent;
  final Color colorPurple = Colors.purple;
  final Color colorWhite = Colors.white;
}

class BorderRaidusItems {
  final BorderRadius borderRadiusButton = BorderRadius.circular(10);
  final BorderRadius borderRadiusCard = BorderRadius.circular(15);
}

class PaddingItems {
  final EdgeInsets paddingElevatedButton = const EdgeInsets.all(8);
  final EdgeInsets paddingBetweenCards = const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15,
  );
  final EdgeInsets paddingInsideCard = const EdgeInsets.symmetric(
    vertical: 15,
    horizontal: 15,
  );
}

class ShapeItems {
  final RoundedRectangleBorder shapeCard = RoundedRectangleBorder(
    borderRadius: BorderRaidusItems().borderRadiusCard,
  );
}

class IconItems {
  final Icon iconAccountCircle = const Icon(Icons.account_circle);
  final Icon iconAdd = const Icon(Icons.add);
  final Icon iconUpdate = const Icon(Icons.update);
  final Icon iconRemoveCircle = const Icon(Icons.remove_circle);
}
