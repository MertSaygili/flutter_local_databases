import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/constants.dart';
import 'package:flutter_local_databases/SharedPreferences/constants/strings.dart';
import '../widgets/custom_persistent_sliver_appbar.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final Strings _strings = Strings();
  final double _expandedHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _sliverPersistentHeader(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Divider(
                  height: 20,
                  thickness: 1,
                  color: ColorItems().colorBlack,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('child')),
              ],
            ),
          )
        ],
      ),
    );
  }

  SliverPersistentHeader _sliverPersistentHeader() {
    return SliverPersistentHeader(
      delegate: CustomPersistenSliverAppbar(
        expandedHeight: _expandedHeight,
        title: _strings.titleSettings,
      ),
      pinned: true,
      floating: true,
    );
  }
}
