import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/assets/screens/asset_detail_screen.dart';
import 'package:tailboard_app/assets/screens/asset_list_screen.dart';
import 'package:tailboard_app/forms/screens/form_demo_screen.dart';
import 'package:tailboard_app/meds/screens/med_calc_screen.dart';
import 'package:tailboard_app/meds/screens/med_list_screen.dart';
import 'package:tailboard_app/personnel/screens/personnel_detail_screen.dart';
import 'package:tailboard_app/protocols/screens/algorithm_list_screen.dart';
import 'package:tailboard_app/screens/alerts_screen.dart';
import 'package:tailboard_app/screens/department_detail_screen.dart';
import 'package:tailboard_app/screens/department_list_screen.dart';
import 'package:tailboard_app/screens/home_screen.dart';
import 'package:tailboard_app/screens/incident_detail_screen.dart';
import 'package:tailboard_app/screens/incident_list_screen.dart';
import 'package:tailboard_app/screens/login_screen.dart';
import 'package:tailboard_app/screens/settings_screen.dart';
import 'package:tailboard_app/screens/station_detail_screen.dart';
import 'package:tailboard_app/screens/user_profile_screen.dart';

final GoRouter router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    if (FirebaseAuth.instance.currentUser == null) {
      return '/login';
    }
    return null;
  },
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
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
                    routes: [
                      GoRoute(
                        path: 'station/:stationId',
                        name: 'station_detail',
                        builder: (BuildContext context, GoRouterState state) =>
                            StationDetailScreen(
                          stationId: state.pathParameters['stationId']!,
                        ),
                      ),
                      GoRoute(
                        path: 'personnel/:personnelId',
                        name: 'personnel_detail',
                        builder: (BuildContext context, GoRouterState state) =>
                            PersonnelDetailScreen(
                                personnelId:
                                    state.pathParameters['personnelId']!),
                      ),
                    ]),
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
            path: "formDemo",
            name: "form_demo",
            builder: (BuildContext context, GoRouterState state) =>
                const FormDemoScreen(),
          ),
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (BuildContext context, GoRouterState state) =>
                const UserProfileScreen(),
          ),
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (BuildContext context, GoRouterState state) =>
                const SettingsScreen(),
          ),
          GoRoute(
            path: 'alerts',
            name: 'alerts',
            builder: (BuildContext context, GoRouterState state) =>
                const AlertsScreen(),
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
