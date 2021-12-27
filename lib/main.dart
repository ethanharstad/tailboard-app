import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tailboard_app/widgets/auth_gate.dart';
import 'firebase_options.dart';

const String appName = "Tailboard";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TailboardApp());
}

Future<void> requestStoragePermission() async {
  final status = await Permission.storage.request();
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
