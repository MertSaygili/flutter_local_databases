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
  final SharedManager _sharedManager = SharedManager();
  final Strings _strings = Strings();
  List<String> _notes = [];
  String _noteName = '';
  String _noteContent = '';

  @override
  void initState() {
    super.initState();
    _sharedManager.init();
    asycnMethod();
  }

  void asycnMethod() async {
    await _sharedManager.init();
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
      body: FutureBuilder(
        future: _sharedManager.getStringList(SharedKeys.notes),
        initialData: const [],
        builder: ((context, snapshot) {
          var data = snapshot.data;
          var dataLength = data?.length ?? 0;

          return dataLength == 0
              ? const Center(child: Text('No data found'))
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data?[index].split('.')[0]),
                      subtitle: Text(data?[index].split('.')[1]),
                    );
                  });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sharedManager.removeKey(SharedKeys.notes);
          setState(() {});
        },
        child: IconItems().iconDelete,
      ),
    );
  }

  Widget _returnTextTitle() => Text(_strings.titleToDo);

  void _navigateToAddNotePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddNoteView(
          appbarleading: _customLeadingAppbarButton(),
        ),
      ),
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

  void _addNote() async {
    if (_noteName.isNotEmpty && _noteContent.isNotEmpty) {
      // add to shared_preferences
      String value = "$_noteName.$_noteContent";

      // adding new note to shared manager
      final List<String> newNotes = widget.notes;
      newNotes.add(value);

      await widget.sharedManager.setStringList(newNotes, SharedKeys.notes);
    } else {
      // do not do anything
    }
  }
}
