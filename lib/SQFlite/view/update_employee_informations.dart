import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/view/add_employee_page.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_elevatedbutton.dart';

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
          CustomElevatedButton(
            fun: _addToDb,
            buttonText: 'Update',
            icon: IconItems().iconUpdate,
          ),
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

  void _saveText(String val, String hintText) {
    String address = val.split('.')[0];
    String splitVal = val.split('.')[1];

    switch (address) {
      case 'department':
        widget.employeeModel.department = splitVal;
        break;
      case 'phone':
        widget.employeeModel.department = splitVal;

        break;
      case 'email':
        widget.employeeModel.department = splitVal;

        break;
    }
  }

  void _addToDb() async {
    String empAdded = 'Employee updated';

    await widget.db.update(widget.employeeModel, widget.employeeModel.id ?? 0);

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
// TODO: BIRAZ DAHA KOD TEMIZLENEBILIR, DUSUN BUNU ZOR GOZUKUYOR AMA YAPILABILIR