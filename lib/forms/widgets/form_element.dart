import 'package:flutter/material.dart';
import 'package:tailboard_app/forms/widgets/boolean_form_widget.dart';
import 'package:tailboard_app/forms/widgets/object_form_widget.dart';
import 'package:tailboard_app/forms/widgets/string_form_widget.dart';

class FormElement extends StatefulWidget {
  final String dataKey;
  final Map<String, dynamic> schema;

  const FormElement({required this.dataKey, required this.schema, super.key});

  @override
  State<FormElement> createState() => _FormElementState();
}

class _FormElementState extends State<FormElement> {
  @override
  Widget build(BuildContext context) {
    switch (widget.schema['type']) {
      case 'boolean':
        return BooleanFormWidget(
          dataKey: widget.dataKey,
          schema: widget.schema,
        );
      case 'string':
        return StringFormWidget(
          dataKey: widget.dataKey,
          schema: widget.schema,
        );
      case 'object':
        return ObjectFormWidget(
          dataKey: widget.dataKey,
          schema: widget.schema,
        );
      default:
        return Text('Unknown type: ${widget.schema['type']}');
    }
  }
}
