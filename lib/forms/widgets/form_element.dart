import 'package:flutter/material.dart';
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
    if(widget.schema['type'] == 'string') {
      return StringFormWidget(dataKey: widget.dataKey, schema: widget.schema);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.schema['title'] != null)
          Text(
            widget.schema['title'],
            style: Theme.of(context).textTheme.titleMedium,
          ),
        if (widget.schema['description'] != null)
          Text(widget.schema['description']),
        Text("${widget.dataKey}[${widget.schema['type']}]"),
        if (widget.schema.containsKey("properties"))
          for (MapEntry<String, dynamic> property
              in (widget.schema['properties'] as Map<String, dynamic>).entries)
            FormElement(
              dataKey: property.key,
              schema: property.value,
            ),
      ],
    );
  }
}
