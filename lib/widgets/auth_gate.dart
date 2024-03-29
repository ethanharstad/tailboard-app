import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:tailboard_app/screens/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            subtitleBuilder: (BuildContext context, AuthAction action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  action == AuthAction.signIn
                      ? 'Welcome to Tailboard! Please sign in to continue.'
                      : 'Welcome to Tailboard! Please create an account to continue',
                ),
              );
            },
            footerBuilder: (context, _) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
            headerBuilder:
                (BuildContext context, BoxConstraints constraints, _) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                      'https://firebase.flutter.dev/img/flutterfire_300x.png'),
                ),
              );
            },
            sideBuilder: (BuildContext context, BoxConstraints constraints) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                      'https://firebase.flutter.dev/img/flutterfire_600x.png'),
                ),
              );
            },
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
          );
        }
        return const HomeScreen();
      },
    );
  }
}
