// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDZLNxUITF-ALl8pI-Ccg2__mMFFLy24As',
    appId: '1:273015035146:web:13272e408646fdbabd56f3',
    messagingSenderId: '273015035146',
    projectId: 'tailboard-dev-112ee',
    authDomain: 'tailboard-dev-112ee.firebaseapp.com',
    storageBucket: 'tailboard-dev-112ee.appspot.com',
    measurementId: 'G-JK3J68YY1B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlPEQjG0-sEV-oWZzqtsr9At2ucXKTElI',
    appId: '1:273015035146:android:bc85b98ebdb976f7bd56f3',
    messagingSenderId: '273015035146',
    projectId: 'tailboard-dev-112ee',
    storageBucket: 'tailboard-dev-112ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAP1YgpUortFcdxThmzlzB8iyyXu4Qdhs',
    appId: '1:273015035146:ios:9e146f5a32f932edbd56f3',
    messagingSenderId: '273015035146',
    projectId: 'tailboard-dev-112ee',
    storageBucket: 'tailboard-dev-112ee.appspot.com',
    iosClientId: '273015035146-v8h7b5baaii7crkqjhikhblvjouplc53.apps.googleusercontent.com',
    iosBundleId: 'dev.strange.tailboard-dev',
  );
}
