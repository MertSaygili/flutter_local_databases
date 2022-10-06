import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/constants.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_textarea.dart';

import '../widgets/custom_textfield.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final Strings _strings = Strings();
  String _noteName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        prefferedSize: Doubles().prefferedSize,
        title: CustomTextfield(
          hintText: _strings.titleEnterNote,
          fun: _setString,
        ),
        fun: _deleteNote,
        toolTip: _strings.deleteNoteTip,
        icon: IconItems().iconDelete,
      ),
      body: const CustomTextarea(),
    );
  }

  void _setString(String value) {
    setState(() {
      _noteName = value;
    });
    print(_noteName);
  }

  void _deleteNote() {}
}
