import 'package:flutter/material.dart';
import 'package:flutter_local_databases/theme/light_custom_theme.dart';

import 'SharedPreferences/ui/view/main_page.dart';

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
      // theme: CustomDarkTheme().theme, for SQFlite
      theme: CustomLightTheme().theme,
      home: const MainPageView(),
    );
  }
}
