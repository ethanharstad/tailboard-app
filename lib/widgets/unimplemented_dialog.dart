import 'package:flutter/material.dart';

class UnimplementedDialog extends StatelessWidget {
  const UnimplementedDialog({
    super.key,
    this.featureName,
  });

  final String? featureName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Unimplemented Feature'),
      content: Text(
          'Sorry, ${featureName ?? 'this'} is just a placeholder for now. Please check again later.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
