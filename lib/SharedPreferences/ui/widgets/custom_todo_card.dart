import 'package:flutter/material.dart';

class CustomTodoCard extends StatelessWidget {
  const CustomTodoCard(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
