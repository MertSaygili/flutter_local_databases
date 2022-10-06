import 'package:flutter/material.dart';

class CustomTextarea extends StatefulWidget {
  const CustomTextarea({super.key});

  @override
  State<CustomTextarea> createState() => _CustomTextareaState();
}

class _CustomTextareaState extends State<CustomTextarea> {
  final double _heightRate = 1.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / _heightRate,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: const TextField(),
      ),
    );
  }
}
