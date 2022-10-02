import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import 'package:flutter_local_databases/SharedPreferences/ui/widgets/custom_silver_appbar.dart';

import '../../constants/constants.dart';
import '../widgets/k.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final Strings _strings = Strings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverPersistentHeader(
          //   pinned: true,
          //   floating: true,
          //   delegate: MySliverAppBar(
          //     expandedHeight: 200,
          //     title: _strings.titleSettings,
          //     icon: IconItems().iconSettings,
          //   ),
          // ),
          CustomSilverAppBar(
            title: _strings.titleSettings,
            icon: IconItems().iconSettings,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
