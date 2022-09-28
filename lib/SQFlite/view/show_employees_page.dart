import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_employee_card.dart';

class ShowEmployeesPageView extends StatefulWidget {
  const ShowEmployeesPageView({super.key, required this.db});

  final DatabaseManager db;

  @override
  State<ShowEmployeesPageView> createState() => _ShowEmployeesPageViewState();
}

class _ShowEmployeesPageViewState extends State<ShowEmployeesPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: FutureBuilder(
        future: widget.db.getEmployees(),
        initialData: const [],
        builder: _builder,
      ),
    );
  }

  Widget _builder(context, snapshot) {
    var data = snapshot.data;
    var dataLength = data!.length;

    return dataLength == 0
        ? const Center(child: Text('No data found'))
        : ListView.builder(
            itemCount: dataLength,
            itemBuilder: (context, index) {
              return CustomEmployeeCard(
                db: widget.db,
                employeeModel: data[index],
              );
            });
  }
}
