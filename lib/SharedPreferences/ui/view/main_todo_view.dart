import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_appbar.dart';

class MainTodoView extends StatefulWidget {
  const MainTodoView({super.key});

  @override
  State<MainTodoView> createState() => _MainTodoViewState();
}

class _MainTodoViewState extends State<MainTodoView> {
  final Strings _strings = Strings();
  final double _prefferedSize = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        prefferedSize: _prefferedSize,
        title: _returnTextTitle(),
        fun: () {},
      ),
    );
  }

  Widget _returnTextTitle() => Text(_strings.titleToDo);
}
