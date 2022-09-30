import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/view/add_employee_page.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';

import '../../constants/constanst.dart';
import '../widgets/approve_dialog.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_floatingactionbutton.dart';
import '../widgets/custom_textfield.dart';

class UpdateEmployeeInformations extends StatefulWidget {
  const UpdateEmployeeInformations(
      {super.key, required this.employeeModel, required this.db});

  final DatabaseManager db;
  final EmployeeModel employeeModel;

  @override
  State<UpdateEmployeeInformations> createState() =>
      _UpdateEmployeeInformationsState();
}

class _UpdateEmployeeInformationsState
    extends State<UpdateEmployeeInformations> {
  final TextInputAction _inputActionNext = TextInputAction.next;
  final TextInputAction _inputActionGo = TextInputAction.go;
  final TextInputType _inputTypeText = TextInputType.text;
  final TextInputType _inputTypePhone = TextInputType.phone;
  final TextInputType _inputTypeEmail = TextInputType.emailAddress;
  final TempEmployeeModelValues _tempValues = TempEmployeeModelValues();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomTextfield(
            labelText: 'name',
            hintText: widget.employeeModel.name,
            inputAction: _inputActionNext,
            inputType: _inputTypeText,
            suffixIcon: IconItems().iconAccountCircle,
            fun: _saveText,
            readOnly: true,
          ),
          CustomTextfield(
            labelText: 'surname',
            hintText: widget.employeeModel.surname,
            inputAction: _inputActionNext,
            inputType: _inputTypeText,
            suffixIcon: IconItems().iconStarsSharp,
            fun: _saveText,
            readOnly: true,
          ),
          CustomTextfield(
            labelText: 'department',
            hintText: widget.employeeModel.department,
            inputAction: _inputActionNext,
            inputType: _inputTypeText,
            suffixIcon: IconItems().iconBuild,
            fun: _saveText,
            readOnly: false,
          ),
          CustomTextfield(
            labelText: 'phone',
            hintText: widget.employeeModel.phoneNumber,
            inputAction: _inputActionNext,
            inputType: _inputTypePhone,
            suffixIcon: IconItems().iconPhone,
            fun: _saveText,
            readOnly: false,
          ),
          CustomTextfield(
            labelText: 'email',
            hintText: widget.employeeModel.eMail,
            inputAction: _inputActionGo,
            inputType: _inputTypeEmail,
            suffixIcon: IconItems().iconEmail,
            fun: _saveText,
            readOnly: false,
          ),
          _checkBoxExpanded(context),
          CustomFloatActionButton(fun: _addToDb, icon: IconItems().iconAdd),
        ],
      ),
    );
  }

  Padding _checkBoxExpanded(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingCheckbox,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Gender(true->woman)',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          CustomCheckbox(fun: _saveText),
        ],
      ),
    );
  }

  void _saveText(String val) {
    if (val.compareTo('true') == 0) {
      _tempValues.gender = true;
    } else if (val.compareTo('false') == 0) {
      _tempValues.gender = false;
    } else {
      String address = val.split('.')[0];
      String splitVal = val.split('.')[1];

      switch (address) {
        case 'name':
          _tempValues.userName = splitVal;
          break;
        case 'surname':
          _tempValues.userSurname = splitVal;
          break;
        case 'department':
          _tempValues.department = splitVal;
          break;
        case 'phone':
          _tempValues.phoneNumber = splitVal;
          break;
        case 'email':
          _tempValues.email = splitVal;
          break;
      }
    }
  }

  void _addToDb() async {
    String empAdded = 'Employee added';

    EmployeeModel employeeModel = EmployeeModel(
      name: _tempValues.userName,
      surname: _tempValues.userSurname,
      department: _tempValues.department,
      phoneNumber: _tempValues.phoneNumber,
      eMail: _tempValues.email,
      gender: _tempValues.gender,
      entryYear: DateTime.now(),
    );

    await widget.db.insert(employeeModel);

    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return CustomApproveDialog(text: empAdded);
      }),
    );

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}
