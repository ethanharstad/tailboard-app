import 'package:flutter/material.dart';
import 'package:tailboard_app/forms/widgets/data_driven_form.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class FormDemoScreen extends StatelessWidget {
  const FormDemoScreen({super.key});

  final String jsonSchema = '''
  {
    "title": "Demo Form",
    "description": "This is just a short demo of the data driven form functionality.",
    "type": "object",
    "properties": {
      "name": {
        "title": "Name",
        "type": "object",
        "description": "Name of this resource",
        "properties": {
          "first": {
            "type": "string",
            "title": "First Name"
          },
          "last": {
            "type": "string",
            "title": "Last Name"
          }
        }
      },
      "quantity": {
        "type": "integer"
      },
      "weight": {
        "type": "number"
      },
      "isUnique": {
        "type": "boolean",
        "title": "Unique"
      },
      "inServiceDate": {
        "type": "string",
        "description": "Name of this resource"
      },
      "description": {
        "type": "string",
        "description": "Name of this resource"
      }
    }
  }
  ''';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Form Demo",
      body: DataDrivenForm(
        schema: jsonSchema,
      ),
    );
  }
}