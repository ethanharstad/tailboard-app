import 'package:flutter/material.dart';
import './form_element.dart';

class ObjectFormWidget extends StatelessWidget {
  final String dataKey;
  final Map<String, dynamic> schema;

  const ObjectFormWidget({required this.dataKey, required this.schema, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: schema['title'],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (schema['description'] != null)
              Text(schema['description']),
            if (schema.containsKey("properties"))
              for (MapEntry<String, dynamic> property
              in (schema['properties'] as Map<String, dynamic>)
                  .entries)
                FormElement(
                  dataKey: property.key,
                  schema: property.value,
                ),
          ],
        ),
      ),
    );
  }
}