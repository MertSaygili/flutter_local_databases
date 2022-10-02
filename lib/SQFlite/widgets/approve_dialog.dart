import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_icon_button.dart';
import 'package:flutter_local_databases/SQFlite/constants/constanst.dart';

class CustomApproveDialog extends StatelessWidget {
  const CustomApproveDialog({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: PaddingItems().paddingDialogBox,
      content: Text(text),
      actions: [
        CustomIconButton(
          fun: () => Navigator.of(context).pop(),
          icon: IconItems().iconDone,
        ),
      ],
    );
  }
}
