import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_textfield.dart';

class CustomTextarea extends StatefulWidget {
  const CustomTextarea({super.key, required this.fun});

  final Function fun;

  @override
  State<CustomTextarea> createState() => _CustomTextareaState();
}

class _CustomTextareaState extends State<CustomTextarea> {
  final double _heightRate = 1.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / _heightRate,
        width: MediaQuery.of(context).size.width,
        child: CustomTextfield(
          hintText: 'Add note',
          maxLines: null,
          inputType: TextInputType.multiline,
          fun: widget.fun,
          icon: null,
          maxLength: null,
        ),
      ),
    );
  }
}
