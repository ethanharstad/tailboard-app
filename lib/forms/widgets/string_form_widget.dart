import 'package:flutter/material.dart';

class StringFormWidget extends StatelessWidget {
  final String dataKey;
  final Map<String, dynamic> schema;

  const StringFormWidget(
      {required this.dataKey, required this.schema, super.key});

  String labelText() {
    if(schema.containsKey('title')) {
      return schema['title'] as String;
    }
    return dataKey;
  }

  String? hintText() {
    if(schema.containsKey('description')) {
      return schema['description'] as String;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText(),
        helperText: hintText(),
      ),
    );
  }
}