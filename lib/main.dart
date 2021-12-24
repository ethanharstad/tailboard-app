import 'package:flutter/material.dart';
import 'package:tailboard_app/screens/home_screen.dart';

const String appName = "Tailboard";

void main() {
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
      home: const HomeScreen(title: appName),
    );
  }
}
