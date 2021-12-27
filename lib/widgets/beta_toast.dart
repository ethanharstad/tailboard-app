import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BetaToast extends SnackBar {
  final String? id;

  BetaToast({this.id, Key? key})
      : super(
          key: key,
          content:
              const Text('This is a beta feature and may not work correctly.'),
          action: id != null ? SnackBarAction(label: 'Dismiss', onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool(_getKey(id), true);
          }) : null,
        );

  static void showBetaToast(BuildContext context, [String? id]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (id == null || prefs.getBool(_getKey(id)) != true) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(BetaToast(id: id));
      });
    }
  }

  static String _getKey(String id) {
    return 'beta.dismissed.$id';
  }
}
