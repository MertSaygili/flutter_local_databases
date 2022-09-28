import 'package:flutter/material.dart';

import '../../constants/constanst.dart';

class CustomStackClose extends StatefulWidget {
  const CustomStackClose({super.key, required this.fun});

  final Function fun;

  @override
  State<CustomStackClose> createState() => _CustomStackCloseState();
}

class _CustomStackCloseState extends State<CustomStackClose> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _customIcon(),
        _customDivider(context),
      ],
    );
  }

  Align _customIcon() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () {},
        icon: IconItems().iconClose,
      ),
    );
  }

  Padding _customDivider(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingDivider,
      child: Divider(
        indent: MediaQuery.of(context).size.width / 30,
        endIndent: MediaQuery.of(context).size.width / 6,
        color: ColorItems().colorWhite,
        thickness: 0.5,
      ),
    );
  }
}
