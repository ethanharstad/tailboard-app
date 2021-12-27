import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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

class TailboardApp extends StatelessWidget {
  const TailboardApp({Key? key}) : super(key: key);

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
