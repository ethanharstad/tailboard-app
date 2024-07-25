import 'package:flutter/material.dart';
import 'package:json_schema/json_schema.dart';

class StringFormWidget extends StatelessWidget {
  final String dataKey;
  final Map<String, dynamic> schema;
  final JsonSchema validatingSchema;

  StringFormWidget({
    required this.dataKey,
    required this.schema,
    super.key,
  }) : validatingSchema = JsonSchema.create(schema);

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
    if (schema.containsKey('minLength')) {
      return schema['minLength'] is int ? schema['minLength'] : null;
    }
  }

  int? maxLength() {
    if (schema.containsKey('maxLength')) {
      return schema['maxLength'] is int ? schema['maxLength'] : null;
    }
  }

  String? validator(String? value) {
    if (value == null) {
      return null;
    }
    ValidationResults results = validatingSchema.validate(value);
    if (results.isValid) return null;
    return results.errors.firstOrNull?.message;
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
