import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/meds/screens/med_calc_screen.dart';
import 'package:tailboard_app/meds/screens/med_list_screen.dart';
import 'package:tailboard_app/protocols/screens/algorithm_list_screen.dart';
import 'package:tailboard_app/repositories/user_repository.dart';
import 'package:tailboard_app/screens/home_screen.dart';
import 'package:tailboard_app/screens/login_screen.dart';
import 'package:tailboard_app/screens/user_profile_screen.dart';

final UserRepository _userRepository = UserRepository();

final GoRouter router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/login';
    }
    return null;
  },
  routes: <GoRoute>[
    GoRoute(
      path: "/",
      name: "home",
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (BuildContext context, GoRouterState state) => const UserProfileScreen(),
    ),
    GoRoute(
      path: "/protocols",
      name: "protocols",
      builder: (BuildContext context, GoRouterState state) =>
          const AlgorithmListScreen(),
    ),
    GoRoute(
      path: "/medications",
      name: "medications",
      builder: (BuildContext context, GoRouterState state) =>
          const MedListScreen(),
    ),
    GoRoute(
      path: "/medicationCalculator",
      name: "medication_calculator",
      builder: (BuildContext context, GoRouterState state) =>
          const MedCalcScreen(),
    ),
  ],
);
