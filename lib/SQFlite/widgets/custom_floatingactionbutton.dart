import 'package:flutter/material.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class CustomFloatActionButton extends StatefulWidget {
  const CustomFloatActionButton({
    super.key,
    required this.fun,
    required this.icon,
  });

  final Function fun;
  final Icon icon;

  @override
  State<CustomFloatActionButton> createState() =>
      _CustomFloatActionButtonState();
}

class _CustomFloatActionButtonState extends State<CustomFloatActionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingTextField,
      child: Align(
        alignment: Alignment.centerRight,
        child: FloatingActionButton(
          onPressed: () => widget.fun(),
          child: widget.icon,
        ),
      ),
    );
  }
}
