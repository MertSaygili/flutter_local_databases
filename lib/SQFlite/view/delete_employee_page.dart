import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_employee_card.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_textfield.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

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
  bool _isCardAlive = false;

  late String _nameSurname;
  late EmployeeModel _employeeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextfield(
            fun: _takeEmployeeName,
            labelText: _labelText,
            hintText: _hintText,
            inputAction: _inputAction,
            inputType: _inputType,
            suffixIcon: _suffixIcon,
          ),
          _isCardAlive
              ? CustomEmployeeCard(employeeModel: _employeeModel)
              : const SizedBox(),
        ],
      ),
    );
  }

  void _takeEmployeeName(String nameSurname) {
    setState(() => {_nameSurname = nameSurname, _isCardAlive = true});
  }
}
