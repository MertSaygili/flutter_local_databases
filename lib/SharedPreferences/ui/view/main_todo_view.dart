import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import 'package:flutter_local_databases/SharedPreferences/core/database/shared_preferences_manager.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/view/add_note_view.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_appbar.dart';

import '../../constants/constants.dart';

class MainTodoView extends StatefulWidget {
  const MainTodoView({super.key});

  @override
  State<MainTodoView> createState() => _MainTodoViewState();
}

class _MainTodoViewState extends State<MainTodoView> {
  late final SharedManager _sharedManager;
  final Strings _strings = Strings();
  List<String> _notes = [];

  @override
  void initState() {
    super.initState();
    _initSharedManager();
    _getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        prefferedSize: Doubles().prefferedSize,
        title: _returnTextTitle(),
        fun: () => _navigateToAddNotePage(),
        toolTip: _strings.addNoteTip,
        icon: IconItems().iconNoteadd,
      ),
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            return const Text('s');
          }),
    );
  }

  Widget _returnTextTitle() => Text(_strings.titleToDo);

  void _initSharedManager() async {
    _sharedManager = SharedManager();
    await _sharedManager.init();
  }

  void _getNotes() async {
    _notes = await _sharedManager.getStringList(SharedKeys.notes);
  }

  void _navigateToAddNotePage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddNoteView()),
    );
  }
}
