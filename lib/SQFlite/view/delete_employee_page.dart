import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';

class DeleteEmployeePageView extends StatefulWidget {
  const DeleteEmployeePageView({super.key, required this.db});

  final DatabaseManager db;

  @override
  State<DeleteEmployeePageView> createState() => _DeleteEmployeePageViewState();
}

class _DeleteEmployeePageViewState extends State<DeleteEmployeePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
    );
  }
}
