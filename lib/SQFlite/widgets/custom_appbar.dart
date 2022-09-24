import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  CustomAppbar({super.key});

  final double _prefferedSizeHeight = 100;
  final String _titleAppbar = 'Employee Manager App';

  @override
  Size get preferredSize => Size.fromHeight(_prefferedSizeHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_titleAppbar, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
