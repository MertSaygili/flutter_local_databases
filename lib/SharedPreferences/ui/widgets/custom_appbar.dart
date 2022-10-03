import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';

class CustomSilverAppBar extends StatelessWidget {
  const CustomSilverAppBar({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;
  final double _prefferedSizeHeight = 200;
  final double _elevation = 15;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Stack(children: [_textAlign(context), _alignIcon()]),
      ),
      elevation: _elevation,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: ColorItems().colorWhite,
      expandedHeight: _prefferedSizeHeight,
      iconTheme: Theme.of(context).iconTheme,
      floating: true,
      pinned: true,
      snap: true,
    );
  }

  Align _alignIcon() {
    return Align(
      alignment: Alignment.bottomRight,
      child: icon,
    );
  }

  Align _textAlign(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
