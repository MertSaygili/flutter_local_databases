import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/core/database/shared_preferences_manager.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/view/main_todo_view.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_appbar.dart';

import '../../constants/constants.dart';

class LoadViewPage extends StatefulWidget {
  const LoadViewPage({super.key});

  @override
  State<LoadViewPage> createState() => _LoadViewPageState();
}

class _LoadViewPageState extends State<LoadViewPage> {
  final String _sharedPreferencesExample = 'SP Example';
  final String _textButton = 'Open Note Book';
  final SharedManager _sharedManager = SharedManager();

  @override
  void initState() {
    super.initState();
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
        title: Text(_sharedPreferencesExample),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return MainTodoView(sharedManager: _sharedManager);
            }));
          },
          child: Text(_textButton),
        ),
      ),
    );
  }
}
