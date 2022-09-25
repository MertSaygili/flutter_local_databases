import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/model/employee_model.dart';
import 'package:flutter_local_databases/constants/constanst.dart';

class CustomEmployeeCard extends StatefulWidget {
  const CustomEmployeeCard({super.key, required this.employeeModel});

  final EmployeeModel employeeModel;

  @override
  State<CustomEmployeeCard> createState() => _CustomEmployeeCardState();
}

class _CustomEmployeeCardState extends State<CustomEmployeeCard> {
  final String _manAvatar = 'assets/images/man_avatar.png';
  final String _womanAvatar = 'assets/images/woman_avatar.png';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingCard,
      child: Card(
        shape: ShapeItems().shapeCard,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    _chooseAvatar(),
                    width: 152,
                    height: 152,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        '${widget.employeeModel.name} ${widget.employeeModel.surname}',
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String _chooseAvatar() {
    // gender ? 1 : 0 -> 1 = woman, 0 = man

    if (widget.employeeModel.gender) {
      return _womanAvatar;
    } else {
      return _manAvatar;
    }
  }
}
