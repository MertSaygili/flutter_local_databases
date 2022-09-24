import 'package:flutter/material.dart';
import 'package:flutter_local_databases/SQFlite/widgets/custom_appbar.dart';

class AddEmployeePageView extends StatefulWidget {
  const AddEmployeePageView({super.key});

  @override
  State<AddEmployeePageView> createState() => _AddEmployeePageViewState();
}

class _AddEmployeePageViewState extends State<AddEmployeePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
    );
  }
}
