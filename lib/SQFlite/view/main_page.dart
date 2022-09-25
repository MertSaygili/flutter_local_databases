import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/view/add_employee_page.dart';
import 'package:flutter_local_databases/SQFlite/view/delete_employee_page.dart';
import 'package:flutter_local_databases/SQFlite/view/show_employees_page.dart';
import 'package:flutter_local_databases/SQFlite/view/update_employee_page.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_elevatedbutton.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

import '../core/database/database_manager.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final db = DatabaseManager(); // database

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
              fun: () => _navigateToPage(ShowEmployeesPageView(db: db)),
              buttonText: _showEmployees,
              icon: _icons.iconAccountCircle,
            ),
            CustomElevatedButton(
              fun: () => _navigateToPage(AddEmployeePageView(db: db)),
              buttonText: _addEmployee,
              icon: _icons.iconAdd,
            ),
            CustomElevatedButton(
              fun: () => _navigateToPage(UpdateEmployeePageView(db: db)),
              buttonText: _updateEmployee,
              icon: _icons.iconUpdate,
            ),
            CustomElevatedButton(
              fun: () => _navigateToPage(DeleteEmployeePageView(db: db)),
              buttonText: _deleteEmployee,
              icon: _icons.iconRemoveCircle,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }
}
