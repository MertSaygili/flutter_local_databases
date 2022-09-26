import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_checkbox.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_textfield.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          Expanded(
            child: CustomTextfield(
              labelText: 'name',
              hintText: 'employee name',
              inputAction: _inputActionNext,
              inputType: _inputTypeText,
              suffixIcon: IconItems().iconAccountCircle,
              fun: _saveText,
            ),
          ),
          Expanded(
            child: CustomTextfield(
              labelText: 'surname',
              hintText: 'employee surname',
              inputAction: _inputActionNext,
              inputType: _inputTypeText,
              suffixIcon: IconItems().iconStarsSharp,
              fun: _saveText,
            ),
          ),
          Expanded(
            child: CustomTextfield(
              labelText: 'department',
              hintText: 'employee department',
              inputAction: _inputActionNext,
              inputType: _inputTypeText,
              suffixIcon: IconItems().iconBuild,
              fun: _saveText,
            ),
          ),
          Expanded(
            child: CustomTextfield(
              labelText: 'phone',
              hintText: 'employee phone number',
              inputAction: _inputActionNext,
              inputType: _inputTypePhone,
              suffixIcon: IconItems().iconPhone,
              fun: _saveText,
            ),
          ),
          Expanded(
            child: CustomTextfield(
              labelText: 'email',
              hintText: 'employee email',
              inputAction: _inputActionGo,
              inputType: _inputTypeEmail,
              suffixIcon: IconItems().iconEmail,
              fun: _saveText,
            ),
          ),
          _checkBoxExpanded(context),
        ],
      ),
    );
  }

  Expanded _checkBoxExpanded(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: PaddingItems().paddingTextField,
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
      ),
    );
  }

  void _saveText(String val) {
    print(val);
  }
}
