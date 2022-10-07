// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/constants.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import 'package:flutter_local_databases/SharedPreferences/core/database/shared_preferences_manager.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_textarea.dart';

import '../widgets/custom_textfield.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({
    super.key,
    required this.sharedManager,
    required this.pop,
  });

  final Function pop;
  final SharedManager sharedManager;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote();
          widget.pop();
        },
        child: const Icon(Icons.add),
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
        widget.pop();
      },
      icon: IconItems().iconArrowBack,
    );
  }

  void _addNote() async {
    // adds new note to shared preferences
    if (_noteName.isNotEmpty && _noteContent.isNotEmpty) {
      String value = "$_noteName.$_noteContent";

      // gets old notes
      List<String> oldNotes =
          await widget.sharedManager.getStringList(SharedKeys.notes);

      // adds new notes to old note and new note
      final List<String> newNotes = oldNotes;
      newNotes.add(value);

      await widget.sharedManager.setStringList(newNotes, SharedKeys.notes);
    }
    // do nothing
  }

  void _setString(String value) => setState(() => _noteName = value);

  void _setContent(String value) => setState(() => _noteContent = value);

  void _deleteNote() {}
}
