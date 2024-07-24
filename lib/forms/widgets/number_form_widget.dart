import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFormWidget extends StatelessWidget {
  final String dataKey;
  final Map<String, dynamic> schema;
  final bool integerOnly;

  const NumberFormWidget({
    required this.dataKey,
    required this.schema,
    this.integerOnly = false,
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText(),
        helperText: hintText(),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        integerOnly
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
      ],
    );
  }
}
