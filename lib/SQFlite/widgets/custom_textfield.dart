import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/constants/constanst.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.fun,
    required this.labelText,
    required this.hintText,
    required this.inputAction,
    required this.inputType,
    required this.suffixIcon,
    required this.readOnly,
  });

  final Function fun;
  final String labelText;
  final String hintText;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final Icon suffixIcon;
  final bool readOnly;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  String _callbackText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingTextField,
      child: TextField(
        onChanged: (value) {
          _callbackText = '${widget.labelText}.$value';
          widget.fun(_callbackText, widget.hintText);
        },
        readOnly: widget.readOnly,
        cursorColor: ColorItems().colorWhite,
        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        autocorrect: true,
        keyboardAppearance: Brightness.dark,
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          border: ShapeItems().borderTextfield,
          // label: Text(widget.labelText),
          hintText: widget.hintText,
          labelStyle: Theme.of(context).textTheme.labelMedium,
          floatingLabelStyle: Theme.of(context).textTheme.labelLarge,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          isDense: false,
          suffixIcon: widget.suffixIcon,
        ),
      ),
    );
  }
}
