import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:tailboard_app/app_router.dart';
import 'package:tailboard_app/blocs/alert_cubit.dart';
import 'package:tailboard_app/blocs/authentication_bloc.dart';
import 'package:tailboard_app/blocs/organization_bloc.dart';
import 'package:tailboard_app/injection.dart';
import 'package:tailboard_app/repositories/remote_config_repository.dart';
import 'package:tailboard_app/services/notification_service.dart';

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
      debug: true);

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

  // Crashlytics Setup
  if(!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  // App Check Setup
  await FirebaseAppCheck.instance.activate(
    androidProvider:
        kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
    appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.appAttest,
    // TODO AppCheck Web - ReCaptchaEnterprise
    webProvider: ReCaptchaEnterpriseProvider('siteKey'),
  );

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
  final AuthenticationBloc authenticationBloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationService.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationService.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationService.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationService.onDismissActionReceivedMethod);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      requestNotificationPermission();
      requestStoragePermission();
      RemoteConfigRepository().update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AlertCubit()),
        BlocProvider(create: (BuildContext context) => OrganizationBloc(authenticationBloc: authenticationBloc))
      ],
      child: MaterialApp.router(
        // navigatorKey: widget.navigatorKey,
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appName,
        theme: ThemeData(
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorSchemeSeed: Colors.red,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorSchemeSeed: Colors.red,
        ),
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
