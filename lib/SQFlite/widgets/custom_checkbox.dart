import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/constants/constanst.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key, required this.fun});

  final Function fun;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _checkboxValue,
      onChanged: ((value) {
        setState(() {
          _checkboxValue = !_checkboxValue;
        });
        _checkboxValue ? widget.fun('true') : widget.fun('false');
      }),
      activeColor: ColorItems().colorPurple,
    );
  }
}
