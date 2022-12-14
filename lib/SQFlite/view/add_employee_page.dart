import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/widgets/approve_dialog.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_checkbox.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_floatingactionbutton.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_textfield.dart';
import 'package:flutter_local_databases/SQFlite/constants/constanst.dart';

class AddEmployeePageView extends StatefulWidget {
  const AddEmployeePageView({super.key, required this.db});

  final DatabaseManager db;

  @override
  State<AddEmployeePageView> createState() => _AddEmployeePageViewState();
}

class _AddEmployeePageViewState extends State<AddEmployeePageView> {
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
      body: Padding(
        padding: PaddingItems().paddingAddEmployeePage,
        child: Column(
          children: [
            CustomTextfield(
              labelText: 'name',
              hintText: 'employee name',
              inputAction: _inputActionNext,
              inputType: _inputTypeText,
              suffixIcon: IconItems().iconAccountCircle,
              fun: _saveText,
              readOnly: false,
            ),
            CustomTextfield(
              labelText: 'surname',
              hintText: 'employee surname',
              inputAction: _inputActionNext,
              inputType: _inputTypeText,
              suffixIcon: IconItems().iconStarsSharp,
              fun: _saveText,
              readOnly: false,
            ),
            CustomTextfield(
              labelText: 'department',
              hintText: 'employee department',
              inputAction: _inputActionNext,
              inputType: _inputTypeText,
              suffixIcon: IconItems().iconBuild,
              fun: _saveText,
              readOnly: false,
            ),
            CustomTextfield(
              labelText: 'phone',
              hintText: 'employee phone',
              inputAction: _inputActionNext,
              inputType: _inputTypePhone,
              suffixIcon: IconItems().iconPhone,
              fun: _saveText,
              readOnly: false,
            ),
            CustomTextfield(
              labelText: 'email',
              hintText: 'employee email',
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

  void _saveText(String val, String hintText) {
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

class TempEmployeeModelValues {
  late String userName;
  late String userSurname;
  late String department;
  late String phoneNumber;
  late String email;
  bool gender = false;
}
