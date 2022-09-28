import 'package:flutter/material.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.fun,
    required this.icon,
  });

  final Function fun;
  final Icon icon;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => widget.fun(),
      icon: widget.icon,
      padding: PaddingItems().paddingZero,
      color: ColorItems().colorWhite,
    );
  }
}
