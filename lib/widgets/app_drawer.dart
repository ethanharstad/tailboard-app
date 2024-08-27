import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/blocs/organization_bloc.dart';
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
          BlocBuilder<OrganizationBloc, OrganizationState>(
            builder: (BuildContext context, OrganizationState state) {
              switch(state) {
                case OrganizationsContent(:final organizations, :final selectedOrganization):
                  return Column(
                    children: [
                      for(Organization o in organizations)
                        ListTile(
                          title: Text(o.name),
                          selected: selectedOrganization?.id == o.id,
                          onTap: () => context.read<OrganizationBloc>().selectOrg(o),
                        ),
                    ],
                  );
                default:
                  return ListTile(
                    title: Text('Loading...'),
                  );
              }
            },
          ),
          Divider(),
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
