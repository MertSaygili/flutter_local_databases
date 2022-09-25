import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';

class UpdateEmployeePageView extends StatefulWidget {
  const UpdateEmployeePageView({super.key, required this.db});

  final DatabaseManager db;

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
