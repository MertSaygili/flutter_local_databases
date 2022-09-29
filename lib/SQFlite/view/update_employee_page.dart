import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_floatingactionbutton.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_search_textfield.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

import '../core/model/employee_model.dart';

class UpdateEmployeePageView extends StatefulWidget {
  const UpdateEmployeePageView({super.key, required this.db});

  final DatabaseManager db;

  @override
  State<UpdateEmployeePageView> createState() => _UpdateEmployeePageViewState();
}

class _UpdateEmployeePageViewState extends State<UpdateEmployeePageView> {
  late EmployeeModel _employeeModel;
  late int _id;

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

  void _takeEmployeeName(String id) {
    int searchId = int.tryParse(id.split('.')[1]) ?? 1;
    // show alert if searchId is null

    setState(() => _id = searchId);
  }

  void _takeEmployeeInformation() async {
    _employeeModel = await widget.db.searchById(_id);
    print(_employeeModel.name);
  }
}
