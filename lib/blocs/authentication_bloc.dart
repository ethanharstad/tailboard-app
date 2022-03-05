import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationBloc extends Cubit<User?> {
  AuthenticationBloc() : super(null) {
    FirebaseAuth.instance.userChanges().listen((authUser) {
      emit(authUser);
    });
  }
}
