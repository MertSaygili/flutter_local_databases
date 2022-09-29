import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_textfield.dart';

import '../../constants/constanst.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key, required this.fun});

  final Function fun;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final String _labelText = 'Calisan ara';
  final String _hintText = 'Calisan adi gir';
  final TextInputAction _inputAction = TextInputAction.done;
  final TextInputType _inputType = TextInputType.text;
  final Icon _suffixIcon = IconItems().iconSearch;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomTextfield(
        fun: widget.fun,
        labelText: _labelText,
        hintText: _hintText,
        inputAction: _inputAction,
        inputType: _inputType,
        suffixIcon: _suffixIcon,
      ),
    );
  }
}
