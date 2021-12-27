import 'package:flutter/material.dart';

class BetaToast extends SnackBar {
  const BetaToast({Key? key})
      : super(
          key: key,
          content:
              const Text('This is a beta feature and may not work correctly.'),
        );

  static showBetaToast(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(const BetaToast());
    });
  }
}
