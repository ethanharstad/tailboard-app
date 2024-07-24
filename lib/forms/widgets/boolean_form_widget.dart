import 'package:flutter/material.dart';

class BooleanFormWidget extends StatefulWidget {
  final String dataKey;
  final Map<String, dynamic> schema;

  const BooleanFormWidget({
    required this.dataKey,
    required this.schema,
    super.key,
  });

  @override
  State<BooleanFormWidget> createState() => _BooleanFormWidgetState();
}

class _BooleanFormWidgetState extends State<BooleanFormWidget> {
  bool value = false;

  String labelText() {
    if (widget.schema.containsKey('title')) {
      return widget.schema['title'] as String;
    }
    return widget.dataKey;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState<dynamic> field) {
        return CheckboxListTile(
          title: Text(labelText()),
          value: value,
          onChanged: (bool? newState) {
            if(newState != null) {
              setState(() {
                value = newState;
              });
            }
          },
        );
      },
    );
  }
}
