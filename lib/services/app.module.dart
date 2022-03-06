import 'package:injectable/injectable.dart';

import './firebase.service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();
}