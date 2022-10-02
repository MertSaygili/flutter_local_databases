import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.icon});

  final String title;
  final Icon icon;
  final double _prefferedSizeHeight = 50;
  final double _elevation = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.headlineMedium,
      elevation: _elevation,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: ColorItems().colorTransparent,
      iconTheme: Theme.of(context).iconTheme,
      actions: [icon],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedSizeHeight);
}
