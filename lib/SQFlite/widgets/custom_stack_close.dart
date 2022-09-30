import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/approve_dialog.dart';
import '../../constants/constanst.dart';
import 'custom_alert_dialog.dart';

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
                return const CustomAlertDialog();
              });
          if (result) {
            String del = 'Employee deleted';
            widget.fun();

            await showDialog(
              context: context,
              builder: ((context) {
                return CustomApproveDialog(text: del);
              }),
            );
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
        endIndent: MediaQuery.of(context).size.width / 8,
        color: ColorItems().colorWhite,
        thickness: 1.5,
      ),
    );
  }
}
