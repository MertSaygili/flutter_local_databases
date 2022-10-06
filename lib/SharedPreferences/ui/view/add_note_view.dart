// ignore_for_file: unused_field

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
  final int _maxLines = 1;
  String _noteName = '';
  String _noteContent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        prefferedSize: Doubles().prefferedSize,
        title: _customTextfield(),
        fun: _deleteNote,
        toolTip: _strings.deleteNoteTip,
        icon: IconItems().iconDelete,
        leading: _customLeadingAppbarButton(),
      ),
      body: CustomTextarea(
        fun: _setContent,
      ),
    );
  }

  CustomTextfield _customTextfield() {
    return CustomTextfield(
      hintText: _strings.titleEnterNote,
      maxLines: _maxLines,
      inputType: TextInputType.text,
      fun: _setString,
      icon: IconItems().iconNoteadd,
      maxLength: Doubles().maxLength,
    );
  }

  IconButton _customLeadingAppbarButton() {
    return IconButton(
      onPressed: () {
        _addNote();
        Navigator.of(context).pop();
      },
      icon: IconItems().iconArrowBack,
    );
  }

  void _addNote() {
    if (_noteName.isNotEmpty && _noteContent.isNotEmpty) {
      // add to shared_preferences
      print('x1');
    } else {
      // do not do anything
      print('x2');
    }
  }

  void _setString(String value) => setState(() => _noteName = value);

  void _setContent(String value) => setState(() => _noteContent = value);

  void _deleteNote() {}
}
