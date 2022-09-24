import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';

class UpdateEmployeePageView extends StatefulWidget {
  const UpdateEmployeePageView({super.key});

  @override
  State<UpdateEmployeePageView> createState() => _UpdateEmployeePageViewState();
}

class _UpdateEmployeePageViewState extends State<UpdateEmployeePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
    );
  }
}
