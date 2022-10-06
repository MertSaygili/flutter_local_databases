import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/constants.dart';

import '../../constants/strings.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({super.key, required this.hintText, required this.fun});

  final String hintText;
  final Function fun;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  final ColorItems _colors = ColorItems();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingAppbarTextfield,
      child: TextField(
        onChanged: (value) => widget.fun(value),
        keyboardAppearance: Brightness.dark,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: _inputDecoration(),
        maxLength: Doubles().maxLength,
        enableSuggestions: false,
        style: Theme.of(context).textTheme.labelMedium,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }

  InputDecoration _inputDecoration() => InputDecoration(
        prefixIcon: IconItems().iconSportBasketball,
        border: const OutlineInputBorder(),
        isCollapsed: true,
        counter: const Offstage(),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        labelStyle: Theme.of(context).textTheme.labelMedium,
        focusColor: _colors.colorBlack,
        hoverColor: _colors.colorBlack,
        fillColor: _colors.colorBlack,
      );
}
