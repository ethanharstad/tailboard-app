import 'package:flutter/material.dart';
import 'package:tailboard_app/forms/widgets/form_element.dart';

class ArrayFormWidget extends StatefulWidget {
  final String dataKey;
  final Map<String, dynamic> schema;

  const ArrayFormWidget({
    required this.dataKey,
    required this.schema,
    super.key,
  });

  @override
  State<ArrayFormWidget> createState() => _ArrayFormWidgetState();
}

class _ArrayFormWidgetState extends State<ArrayFormWidget> {
  List<dynamic> elements = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.schema['title'],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.schema['description'] != null)
              Text(widget.schema['description']),
            for (var element in elements)
              FormElement(dataKey: '[]', schema: widget.schema['items']),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  elements.add(null);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
