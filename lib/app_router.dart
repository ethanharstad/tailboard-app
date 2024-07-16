import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/assets/screens/asset_detail_screen.dart';
import 'package:tailboard_app/assets/screens/asset_list_screen.dart';
import 'package:tailboard_app/meds/screens/med_calc_screen.dart';
import 'package:tailboard_app/meds/screens/med_list_screen.dart';
import 'package:tailboard_app/protocols/screens/algorithm_list_screen.dart';
import 'package:tailboard_app/screens/department_detail_screen.dart';
import 'package:tailboard_app/screens/department_list_screen.dart';
import 'package:tailboard_app/screens/home_screen.dart';
import 'package:tailboard_app/screens/incident_detail_screen.dart';
import 'package:tailboard_app/screens/incident_list_screen.dart';
import 'package:tailboard_app/screens/login_screen.dart';
import 'package:tailboard_app/screens/user_profile_screen.dart';

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
        builder: (BuildContext context, GoRouterState state) => HomeScreen(),
        routes: [
          GoRoute(
              path: 'departments',
              name: 'departments',
              builder: (BuildContext context, GoRouterState state) =>
                  DepartmentListScreen(),
              routes: [
                GoRoute(
                  path: ':departmentId',
                  name: 'department_detail',
                  builder: (BuildContext context, GoRouterState state) =>
                      DepartmentDetailScreen(
                    departmentId: state.pathParameters['departmentId']!,
                  ),
                ),
              ]),
          GoRoute(
            path: 'incidents',
            name: 'incidents',
            builder: (BuildContext context, GoRouterState state) =>
                IncidentListScreen(),
            routes: [
              GoRoute(
                path: ':incidentId',
                name: 'incident_detail',
                builder: (BuildContext context, GoRouterState state) =>
                    IncidentDetailScreen(
                        incidentId: state.pathParameters['incidentId']!),
              ),
            ],
          ),
          GoRoute(
            path: 'assets',
            name: 'assets',
            builder: (BuildContext context, GoRouterState state) =>
                AssetListScreen(),
            routes: [
              GoRoute(
                path: ':assetId',
                name: 'asset_detail',
                builder: (BuildContext context, GoRouterState state) =>
                    AssetDetailScreen(
                        assetId: state.pathParameters['assetId']!),
              ),
            ],
          ),
          GoRoute(
            path: "protocols",
            name: "protocols",
            builder: (BuildContext context, GoRouterState state) =>
                const AlgorithmListScreen(),
          ),
          GoRoute(
            path: "medications",
            name: "medications",
            builder: (BuildContext context, GoRouterState state) =>
                const MedListScreen(),
          ),
          GoRoute(
            path: "medicationCalculator",
            name: "medication_calculator",
            builder: (BuildContext context, GoRouterState state) =>
                const MedCalcScreen(),
          ),
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (BuildContext context, GoRouterState state) =>
                const UserProfileScreen(),
          ),
        ]),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
  ],
);
