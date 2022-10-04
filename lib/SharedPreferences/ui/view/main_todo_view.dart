import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/view/add_note_view.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_appbar.dart';

class MainTodoView extends StatefulWidget {
  const MainTodoView({super.key});

  @override
  State<MainTodoView> createState() => _MainTodoViewState();
}

class _MainTodoViewState extends State<MainTodoView> {
  final Strings _strings = Strings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        prefferedSize: Doubles().prefferedSize,
        title: _returnTextTitle(),
        fun: () => _navigateToAddNotePage(),
      ),
    );
  }

  Widget _returnTextTitle() => Text(_strings.titleToDo);

  void _navigateToAddNotePage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const AddNoteView();
      },
    ));
  }
}
