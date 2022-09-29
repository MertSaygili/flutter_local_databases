import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_icon_button.dart';

import '../../constants/constanst.dart';

class CustomStackClose extends StatefulWidget {
  const CustomStackClose({super.key, required this.fun});

  final Function fun;

  @override
  State<CustomStackClose> createState() => _CustomStackCloseState();
}

class _CustomStackCloseState extends State<CustomStackClose> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _customIcon(),
        _customDivider(context),
      ],
    );
  }

  Align _customIcon() {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: () async {
          final result = await showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return const _CustomAlertDialog();
              });
          if (result) {
            widget.fun();
          }
        },
        icon: IconItems().iconClose,
      ),
    );
  }

  Padding _customDivider(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingDivider,
      child: Divider(
        indent: MediaQuery.of(context).size.width / 30,
        endIndent: MediaQuery.of(context).size.width / 6,
        color: ColorItems().colorWhite,
        thickness: 0.5,
      ),
    );
  }
}

class _CustomAlertDialog extends StatelessWidget {
  const _CustomAlertDialog({
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
