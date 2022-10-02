import 'package:flutter/material.dart';
import 'package:flutter_local_databases/theme/dark_custom_theme.dart';
import 'SharedPreferences/view/main_page.dart';

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
      theme: CustomDarkTheme().theme,
      home: const MainPageView(),
    );
  }
}
