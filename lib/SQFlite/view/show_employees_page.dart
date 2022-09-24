import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/core/database/database_manager.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';

class ShowEmployeesPageView extends StatefulWidget {
  const ShowEmployeesPageView({super.key});

  @override
  State<ShowEmployeesPageView> createState() => _ShowEmployeesPageViewState();
}

class _ShowEmployeesPageViewState extends State<ShowEmployeesPageView> {
  final databaseManager = DatabaseManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: FutureBuilder(
        future: databaseManager.getEmployees(),
        initialData: const [],
        builder: (context, snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;

          return dataLength == 0
              ? const Center(child: Text('No data found'))
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('${data[index].name}'),
                      ),
                    );
                  });
        },
      ),
    );
  }
}
