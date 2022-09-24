import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/view/main_page.dart';
import 'package:flutter_local_databases/theme/dark_custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Databases',
      theme: CustomDarkTheme().theme,
      home: const MainPageView(),
    );
  }
}
