import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:tailboard_app/injection.dart';
import 'package:tailboard_app/protocols/screens/algorithm_list_screen.dart';
import 'package:tailboard_app/widgets/auth_gate.dart';

const String appName = "Tailboard";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Setup quick actions
  const QuickActions quickActions = QuickActions();
  quickActions.initialize((String shortcutType) {
    if (shortcutType == 'protocols') {
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (BuildContext context) {
          return const AlgorithmListScreen();
        })
      );
    }
  });
  quickActions.setShortcutItems(<ShortcutItem>[
    const ShortcutItem(
      type: 'protocols',
      localizedTitle: "Protocols",
      // icon: 'bolt'
    ),
  ]);

  await configureDependencies();
  runApp(TailboardApp(navigatorKey: navigatorKey));
}

Future<void> requestStoragePermission() async {
  await Permission.storage.request();
}

class TailboardApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const TailboardApp({required this.navigatorKey, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TailboardAppState();
}

class _TailboardAppState extends State<TailboardApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      requestStoragePermission();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      title: appName,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.red,
      ),
      home: const AuthGate(),
    );
  }
}
