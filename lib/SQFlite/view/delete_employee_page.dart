import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
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

  late String _name;
  late EmployeeModel _employeeModel;

  bool _isCardAlive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          CustomTextfield(
            fun: _takeEmployeeName,
            labelText: _labelText,
            hintText: _hintText,
            inputAction: _inputAction,
            inputType: _inputType,
            suffixIcon: _suffixIcon,
          ),
          _isCardAlive ? const Text('sad') : const SizedBox(),
        ],
      ),
      floatingActionButton: CustomFloatActionButton(
        fun: _takeEmployees,
        icon: IconItems().iconSearch,
      ),
    );
  }

  void _takeEmployeeName(String name) {
    setState(() => _name = name.split('.')[1]);
  }

  void _takeEmployees() async {
    print(_name);
    setState(() => _isCardAlive = true);
    List<EmployeeModel> data = await widget.db.searchByName(_name);

    print(data);
  }
}
