import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_textfield.dart';

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
  final TextInputType _inputTypeEmail = TextInputType.phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          CustomTextfield(
            labelText: 'Employee name',
            hintText: 'Employee name',
            inputAction: _inputActionNext,
            inputType: _inputTypeText,
          ),
        ],
      ),
    );
  }

  void saveText(String val) {}
}
