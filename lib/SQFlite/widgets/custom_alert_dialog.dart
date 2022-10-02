import 'package:flutter/material.dart';

import '../constants/constanst.dart';
import 'custom_icon_button.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: PaddingItems().paddingDialogBox,
      titlePadding: PaddingItems().paddingZero,
      title: Align(
        alignment: Alignment.topRight,
        child: CustomIconButton(
          fun: () => Navigator.of(context).pop<bool>(false),
          icon: IconItems().iconClose,
        ),
      ),
      content: Text(
        'Are you sure to delete employee?',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: [
        CustomIconButton(
          fun: () => Navigator.of(context).pop<bool>(true),
          icon: IconItems().iconRemoveCircle,
        ),
      ],
    );
  }
}
