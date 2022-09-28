import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_stack_close.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class CustomRemoveIconButton extends StatefulWidget {
  const CustomRemoveIconButton({
    super.key,
    required this.fun,
    required this.icon,
  });

  final Function fun;
  final Icon icon;

  @override
  State<CustomRemoveIconButton> createState() => _CustomRemoveIconButtonState();
}

class _CustomRemoveIconButtonState extends State<CustomRemoveIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final result = await ShowDialogs()._showAlertDialog(
          context,
          _removeItem,
        );

        if (result) {
          widget.fun();
        }
      },
      icon: widget.icon,
      padding: PaddingItems().paddingZero,
      color: ColorItems().colorWhite,
    );
  }

  void _removeItem() => Navigator.of(context).pop<bool>(true);
}

class ShowDialogs {
  Future<bool> _showAlertDialog(BuildContext context, Function funTrue) async {
    final result = await showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: CustomStackClose(fun: () {
              Navigator.of(context).pop<bool>(false);
            }),
            content: const Text('Are you sure to delete this employee?'),
            actions: [
              IconButton(
                onPressed: () => funTrue(),
                icon: IconItems().iconRemoveCircle,
              ),
            ],
          );
        });

    return result;
  }
}
