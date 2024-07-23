import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tailboard_app/forms/widgets/form_element.dart';

class DataDrivenForm extends StatefulWidget {
  final String schema;

  const DataDrivenForm({required this.schema, super.key});

  @override
  State<DataDrivenForm> createState() => _DataDrivenFormState();
}

class _DataDrivenFormState extends State<DataDrivenForm> {
  late Map<String, dynamic> schema;

  @override
  void initState() {
    super.initState();
    schema = jsonDecode(widget.schema);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormElement(
          dataKey: "_root",
          schema: schema,
        ),
      ],
    );
  }
}
