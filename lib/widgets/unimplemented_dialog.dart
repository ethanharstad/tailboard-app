import 'package:flutter/material.dart';

class UnimplementedDialog extends StatelessWidget {
  const UnimplementedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Unimplemented Feature'),
      content: const Text(
          'Sorry, this is just a placeholder for now. Please check again later.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
