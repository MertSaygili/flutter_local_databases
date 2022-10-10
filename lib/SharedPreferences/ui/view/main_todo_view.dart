import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import 'package:flutter_local_databases/SharedPreferences/core/database/shared_preferences_manager.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/view/add_note_view.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_todo_card.dart';

import '../../constants/constants.dart';

class MainTodoView extends StatefulWidget {
  const MainTodoView({super.key});

  @override
  State<MainTodoView> createState() => _MainTodoViewState();
}

class _MainTodoViewState extends State<MainTodoView> {
  final SharedManager _sharedManager = SharedManager();
  final Strings _strings = Strings();

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
                    return CustomTodoCard(
                      title: data![index].split('.')[0],
                      subtitle: data[index].split('.')[1],
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
          sharedManager: _sharedManager,
          pop: _pop,
        ),
      ),
    );
  }

  void _pop() {
    Navigator.of(context).pop();
    setState(() {});
  }
}
