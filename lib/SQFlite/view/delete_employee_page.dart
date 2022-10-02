import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_employee_card.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_search_textfield.dart';
import 'package:flutter_local_databases/SQFlite/constants/constanst.dart';

import '../widgets/custom_floatingactionbutton.dart';

class DeleteEmployeePageView extends StatefulWidget {
  const DeleteEmployeePageView({super.key, required this.db});

  final DatabaseManager db;

  @override
  State<DeleteEmployeePageView> createState() => _DeleteEmployeePageViewState();
}

class _DeleteEmployeePageViewState extends State<DeleteEmployeePageView> {
  late List<EmployeeModel> _employeeModels;
  final int _flex = 3;

  late String _name;

  bool _isCardAlive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomSearchTextField(fun: _takeEmployeeName, text: 'Isim gir'),
          _isCardAlive
              ? Expanded(
                  flex: _flex,
                  child: ListView.builder(
                    itemCount: _employeeModels.length,
                    itemBuilder: ((context, index) {
                      return CustomEmployeeCard(
                        db: widget.db,
                        employeeModel: _employeeModels[index],
                      );
                    }),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      floatingActionButton: CustomFloatActionButton(
        fun: _takeEmployees,
        icon: IconItems().iconSearch,
      ),
    );
  }

  void _takeEmployeeName(String name, String hintText) =>
      setState(() => _name = name.split('.')[1]);

  void _takeEmployees() async {
    List<EmployeeModel> data = await widget.db.searchByName(_name);
    _employeeModels = data;
    setState(() => _isCardAlive = true);
  }
}
