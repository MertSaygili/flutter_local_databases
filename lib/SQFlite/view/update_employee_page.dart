import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_floatingactionbutton.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_search_textfield.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class UpdateEmployeePageView extends StatefulWidget {
  const UpdateEmployeePageView({super.key, required this.db});

  final DatabaseManager db;

  @override
  State<UpdateEmployeePageView> createState() => _UpdateEmployeePageViewState();
}

class _UpdateEmployeePageViewState extends State<UpdateEmployeePageView> {
  late final String _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomSearchTextField(fun: _takeEmployeeName, text: 'id gir'),
        ],
      ),
      floatingActionButton: CustomFloatActionButton(
        fun: _takeEmployeeInformation,
        icon: IconItems().iconSearch,
      ),
    );
  }

  void _takeEmployeeName(String name) =>
      setState(() => _name = name.split('.')[1]);

  void _takeEmployeeInformation(String id) {}
}
