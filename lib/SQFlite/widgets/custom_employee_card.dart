// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/SQFlite/view/show_employees_page.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_stack_close.dart';
import 'package:flutter_local_databases/SQFlite/constants/constanst.dart';

class CustomEmployeeCard extends StatefulWidget {
  const CustomEmployeeCard({
    super.key,
    required this.employeeModel,
    required this.db,
  });

  final EmployeeModel employeeModel;
  final DatabaseManager db;

  @override
  State<CustomEmployeeCard> createState() => _CustomEmployeeCardState();
}

class _CustomEmployeeCardState extends State<CustomEmployeeCard> {
  final double _elevation = 15;
  final double _sizedBoxHeight = 230;
  final int _topPadding = 7;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingBetweenCards,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: _sizedBoxHeight,
        child: Card(
          elevation: _elevation,
          shape: ShapeItems().shapeCard,
          child: Padding(
            padding: PaddingItems().paddingInsideCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: CustomStackClose(fun: _deleteEmployee),
                ),
                _RowImageText(data: widget.employeeModel, function: _textRow),
                _textRow(
                  widget.employeeModel.phoneNumber,
                  _topPadding,
                ),
                _textRow(widget.employeeModel.eMail, _topPadding)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _deleteEmployee() async {
    await widget.db.delete(widget.employeeModel.id ?? 0);

    // to refreshing page
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return ShowEmployeesPageView(db: widget.db);
      }),
    );
  }

  Padding _textRow(String text, int top) {
    return Padding(
      padding: EdgeInsets.only(top: top.toDouble()),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
        overflow: TextOverflow.visible,
      ),
    );
  }
}

class _RowImageText extends StatelessWidget {
  const _RowImageText({required this.data, required this.function});

  final Function function;
  final EmployeeModel data;

  final String _manAvatar = 'assets/images/man_avatar.png';
  final String _womanAvatar = 'assets/images/woman_avatar.png';
  final String _threeCharacterSpace = '   ';
  final double _imageSize = 100;
  final int _topPadding = 7;
  final int _flex = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: _flex,
          child: _imageAsset(),
        ),
        Expanded(
          flex: _flex * 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                function(
                  '${data.id}- ${data.name} ${data.surname}',
                  _topPadding,
                ),
                function(
                  '$_threeCharacterSpace${data.department}',
                  _topPadding,
                ),
                function(_correctDateForm(), _topPadding),
              ],
            ),
          ),
        )
      ],
    );
  }

  String _correctDateForm() {
    return '$_threeCharacterSpace${data.entryYear.day}:${data.entryYear.month}:${data.entryYear.year}';
  }

  String _chooseAvatar() {
    // gender ? 1 : 0 -> 1 = woman, 0 = man

    if (data.gender) {
      return _womanAvatar;
    } else {
      return _manAvatar;
    }
  }

  Image _imageAsset() => Image.asset(
        _chooseAvatar(),
        width: _imageSize,
        height: _imageSize,
      );
}
