import 'package:flutter/material.dart';

class StringFormWidget extends StatelessWidget {
  final String dataKey;
  final Map<String, dynamic> schema;

  const StringFormWidget({
    required this.dataKey,
    required this.schema,
    super.key,
  });

  String labelText() {
    if (schema.containsKey('title')) {
      return schema['title'] as String;
    }
    return dataKey;
  }

  String? hintText() {
    if (schema.containsKey('description')) {
      return schema['description'] as String;
    }
    return null;
  }

  int? minLength() {
    if(schema.containsKey('minLength')) {
      return schema['minLength'] is int ? schema['minLength'] : null;
    }
  }

  int? maxLength() {
    if(schema.containsKey('maxLength')) {
      return schema['maxLength'] is int ? schema['maxLength'] : null;
    }
  }

  String? validator(String? value) {
    if(value == null) {
      return null;
    }
    if(minLength() != null) {
      if(value!.length < minLength()!) {
        return "Must be at least ${minLength()} characters.";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText(),
        helperText: hintText(),
      ),
      maxLength: maxLength(),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
