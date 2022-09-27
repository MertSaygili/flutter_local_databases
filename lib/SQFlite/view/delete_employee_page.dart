import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_employee_card.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_textfield.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

import '../widgets/custom_floatingactionbutton.dart';

class DeleteEmployeePageView extends StatefulWidget {
  const DeleteEmployeePageView({super.key, required this.db});

  final DatabaseManager db;

  @override
  State<DeleteEmployeePageView> createState() => _DeleteEmployeePageViewState();
}

class _DeleteEmployeePageViewState extends State<DeleteEmployeePageView> {
  final String _labelText = 'Calisan ara';
  final String _hintText = 'Calisan adi gir';
  final TextInputAction _inputAction = TextInputAction.done;
  final TextInputType _inputType = TextInputType.text;
  final Icon _suffixIcon = IconItems().iconSearch;

  late final List<EmployeeModel> _employeeModels;

  late String _name;

  bool _isCardAlive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: CustomTextfield(
              fun: _takeEmployeeName,
              labelText: _labelText,
              hintText: _hintText,
              inputAction: _inputAction,
              inputType: _inputType,
              suffixIcon: _suffixIcon,
            ),
          ),
          _isCardAlive
              ? Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: _employeeModels.length,
                    itemBuilder: ((context, index) {
                      return CustomEmployeeCard(
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

  void _takeEmployeeName(String name) =>
      setState(() => _name = name.split('.')[1]);

  void _takeEmployees() async {
    List<EmployeeModel> data = await widget.db.searchByName(_name);
    _employeeModels = data;
    setState(() => _isCardAlive = true);
  }
}
