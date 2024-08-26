import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationBloc extends Cubit<User?> {
  AuthenticationBloc() : super(FirebaseAuth.instance.currentUser) {
    FirebaseAuth.instance.userChanges().listen((authUser) {
      emit(authUser);
    });
  }
}
