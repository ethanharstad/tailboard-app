import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tailboard_app/injection.dart';
import 'package:tailboard_app/widgets/auth_gate.dart';

const String appName = "Tailboard";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Hive.initFlutter();
  runApp(const TailboardApp());
}

Future<void> requestStoragePermission() async {
  await Permission.storage.request();
}

class TailboardApp extends StatefulWidget {
  const TailboardApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TailboardAppState();
}

class _TailboardAppState extends State<TailboardApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      requestStoragePermission();
    });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.red,
      ),
      home: const AuthGate(),
    );
  }
}
