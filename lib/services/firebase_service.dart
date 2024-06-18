import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tailboard_app/firebase_options.dart';
import 'package:tailboard_app/app_router.dart';

@injectable
class FirebaseService {
  @FactoryMethod(preResolve: true)
  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // Logged out
        router.go('/login');
      }
    });

    return FirebaseService();
  }
}
