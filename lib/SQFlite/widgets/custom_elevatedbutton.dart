import 'package:flutter/material.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.fun,
    required this.buttonText,
    required this.icon,
  });

  final Function fun;
  final String buttonText;
  final Icon icon;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingElevatedButton,
      child: ElevatedButton(
        onPressed: () => widget.fun(),
        child: Stack(
          children: [
            _alignText(context),
            _alignIcon(),
          ],
        ),
      ),
    );
  }

  Align _alignText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        widget.buttonText,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  _alignIcon() => Align(alignment: Alignment.centerRight, child: widget.icon);
}
