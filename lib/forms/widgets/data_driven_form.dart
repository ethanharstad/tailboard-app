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
        if (schema['title'] != null)
          Text(
            schema['title'],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        if (schema['description'] != null) Text(schema['description']),
        const SizedBox(height: 4.0),
        for (MapEntry<String, dynamic> property
            in (schema['properties'] as Map<String, dynamic>).entries)
          FormElement(
            dataKey: property.key,
            schema: property.value,
          ),
      ],
    );
  }
}
