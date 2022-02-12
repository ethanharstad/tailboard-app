import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tailboard_app/models/app_user.dart';
import 'package:tailboard_app/repositories/user_repository.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          StreamBuilder<AppUser?>(
            stream: userRepository.getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return UserAccountsDrawerHeader(
                  accountName: Text(snapshot.data!.fullName),
                  accountEmail: Text(snapshot.data!.email),
                  currentAccountPicture: CircleAvatar(
                    child: Text(snapshot.data!.fullName.split(' ').map((e) => e[0]).join()),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
