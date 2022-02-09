import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BetaToast extends SnackBar {
  final String? id;
  final Box box;

  BetaToast({this.id, required this.box, Key? key})
      : super(
          key: key,
          content:
              const Text('This is a beta feature and may not work correctly.'),
          action: id != null
              ? SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () async {
                    box.put(_getKey(id), true);
                  })
              : null,
        );

  static void showBetaToast(BuildContext context, [String? id]) async {
    Box box = await Hive.openBox<bool>('betaPreferences');
    if (id == null || box.get(_getKey(id)) != true) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(BetaToast(id: id, box: box));
      });
    }
  }

  static String _getKey(String id) {
    return 'beta.dismissed.$id';
  }
}
