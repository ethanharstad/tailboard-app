import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/models/app_user.dart';
import 'package:tailboard_app/models/organization.dart';
import 'package:tailboard_app/models/user_access.dart';
import 'package:tailboard_app/repositories/organization_repository.dart';
import 'package:tailboard_app/repositories/user_access_repository.dart';
import 'package:tailboard_app/repositories/user_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final UserRepository _userRepository = UserRepository();
  final UserAccessRepository _accessRepository = UserAccessRepository();
  final OrganizationRepository _organizationRepository =
      OrganizationRepository();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          StreamBuilder<AppUser?>(
              stream: _userRepository.getUser(FirebaseAuth.instance.currentUser?.uid ?? ''),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(snapshot.data!.fullName),
                    accountEmail: Text(snapshot.data!.email),
                    currentAccountPicture: CircleAvatar(
                      child: Text(snapshot.data!.fullName
                          .split(' ')
                          .map((e) => e[0])
                          .join()),
                    ),
                    onDetailsPressed: () {
                      context.go('/profile');
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
          StreamBuilder<List<UserAccess>>(
            stream: _accessRepository.getUserAccess(),
            initialData: const [],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    for (var userAccess in snapshot.data!)
                      StreamBuilder<Organization?>(
                          stream: _organizationRepository
                              .getOrganization(userAccess.organization),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var org = snapshot.data!;
                              return ListTile(
                                title: Text(org.name),
                              );
                            }
                            return Container();
                          }),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settings),
            leading: const Icon(Icons.settings),
            onTap: () => context.goNamed("settings"),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.signOut),
            leading: const Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
