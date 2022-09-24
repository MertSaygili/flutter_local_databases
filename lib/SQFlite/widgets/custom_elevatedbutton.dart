import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    this.fun,
    required this.buttonText,
    this.icon,
  });

  final Function? fun;
  final String buttonText;
  final Icon? icon;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.buttonText,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
