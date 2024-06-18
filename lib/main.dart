import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:tailboard_app/injection.dart';
import 'package:tailboard_app/services/notification_service.dart';
import 'package:tailboard_app/app_router.dart';

const String appName = "Tailboard";

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Setup notifications
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true
  );

  // Setup quick actions
  const QuickActions quickActions = QuickActions();
  quickActions.initialize((String shortcutType) {
    if (shortcutType == 'protocols') {
      router.go('/protocols');
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
  const app = TailboardApp();
  getIt.registerSingleton(app);
  runApp(app);
}

Future<void> requestStoragePermission() async {
  await Permission.storage.request();
}

Future<void> requestNotificationPermission() async {
  await Permission.notification.request();
}

class TailboardApp extends StatefulWidget {
  const TailboardApp({super.key});

  @override
  State<StatefulWidget> createState() => _TailboardAppState();
}

class _TailboardAppState extends State<TailboardApp> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:         NotificationService.onActionReceivedMethod,
        onNotificationCreatedMethod:    NotificationService.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationService.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationService.onDismissActionReceivedMethod
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      requestNotificationPermission();
      requestStoragePermission();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // navigatorKey: widget.navigatorKey,
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
      routerConfig: router,
    );
  }
}
