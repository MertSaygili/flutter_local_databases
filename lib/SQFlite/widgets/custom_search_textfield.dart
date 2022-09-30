// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_local_databases/SQFlite/widgets/custom_textfield.dart';

import '../../constants/constanst.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    Key? key,
    required this.fun,
    required this.text,
  }) : super(key: key);

  final Function fun;
  final String text;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late final String _labelText;
  late final String _hintText;

  final TextInputAction _inputAction = TextInputAction.done;
  final TextInputType _inputType = TextInputType.text;
  final Icon _suffixIcon = IconItems().iconSearch;

  final int _flex = 1;

  @override
  void initState() {
    super.initState();
    _labelText = widget.text;
    _hintText = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: _flex,
      child: CustomTextfield(
        fun: widget.fun,
        labelText: _labelText,
        hintText: _hintText,
        inputAction: _inputAction,
        inputType: _inputType,
        suffixIcon: _suffixIcon,
        readOnly: false,
      ),
    );
  }
}
