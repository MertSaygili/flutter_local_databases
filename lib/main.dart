import 'package:flutter/material.dart';
import 'package:flutter_local_databases/theme/dark_custom_theme.dart';
import 'SharedPreferences/ui/view/main_todo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FloatingActionButtonLocation.centerDocked;
    return MaterialApp(
      title: 'Flutter Local Databases',
      // dark theme
      theme: CustomDarkTheme().theme,
      // light theme
      // theme: CustomLightTheme().theme,
      home: const MainTodoView(),
    );
  }
}
