import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_app_bar.dart';

import '../../constants/constants.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final Stringss _stringss = Stringss();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _stringss.titleSettings,
        icon: IconItems().iconSettings,
      ),
      body: Center(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
