import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_elevatedbutton.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
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
            CustomElevatedButton(fun: null, buttonText: _showEmployees),
            CustomElevatedButton(fun: null, buttonText: _addEmployee),
            CustomElevatedButton(fun: null, buttonText: _updateEmployee),
            CustomElevatedButton(fun: null, buttonText: _deleteEmployee),
          ],
        ),
      ),
    );
  }
}
