import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_schema/json_schema.dart';

class NumberFormWidget extends StatelessWidget {
  final String dataKey;
  final Map<String, dynamic> schema;
  final bool integerOnly;
  final JsonSchema validatingSchema;

  NumberFormWidget({
    required this.dataKey,
    required this.schema,
    this.integerOnly = false,
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

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    dynamic numVal =
        schema['type'] == 'integer' ? int.tryParse(value) : double.tryParse(value);
    if(numVal == null) {
      return "Not a number.";
    }
    ValidationResults results = validatingSchema.validate(numVal);
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
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      inputFormatters: [
        integerOnly
            ? FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]'))
            : FilteringTextInputFormatter.allow(RegExp(r'[0-9\-\.]')),
      ],
    );
  }
}
