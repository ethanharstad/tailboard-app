import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:tailboard_app/firebase_options.dart';

@injectable
class FirebaseService {
  @FactoryMethod(preResolve: true)
  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return FirebaseService();
  }
}
