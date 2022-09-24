import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_elevatedbutton.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late final IconItems _icons = IconItems();
  final String _showEmployees = 'show employees';
  final String _addEmployee = 'add employee';
  final String _updateEmployee = 'update employee';
  final String _deleteEmployee = 'delete employee';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomElevatedButton(
              fun: null,
              buttonText: _showEmployees,
              icon: _icons.iconAccountCircle,
            ),
            CustomElevatedButton(
              fun: null,
              buttonText: _addEmployee,
              icon: _icons.iconAdd,
            ),
            CustomElevatedButton(
              fun: null,
              buttonText: _updateEmployee,
              icon: _icons.iconUpdate,
            ),
            CustomElevatedButton(
              fun: null,
              buttonText: _deleteEmployee,
              icon: _icons.iconRemoveCircle,
            ),
          ],
        ),
      ),
    );
  }
}
