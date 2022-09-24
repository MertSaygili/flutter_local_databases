import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';

class ShowEmployeesPageView extends StatelessWidget {
  const ShowEmployeesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: ListView.builder(itemBuilder: (context, index) {
        return const Text('s');
      }),
    );
  }
}
