import 'package:flutter/material.dart';
import 'package:tailboard_app/screens/bls_protocol_screen.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/launcher_tile.dart';

class QuickProtocolsScreen extends StatelessWidget {
  const QuickProtocolsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Quick Protocols',
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 2,
        children: <Widget>[
          LauncherTile(
            icon: Icons.local_hospital,
            title: 'BLS',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const BLSProtocolScreen();
              }));
            },
          ),
          LauncherTile(
            icon: Icons.favorite,
            title: 'ACLS',
            onTap: () {},
          ),
          LauncherTile(
            icon: Icons.remove_circle,
            title: 'Bradycardia',
            onTap: () {},
          ),
          LauncherTile(
            icon: Icons.add_circle,
            title: 'Tachycardia',
            onTap: () {},
          ),
          LauncherTile(
            icon: Icons.medical_services,
            title: 'ROSC',
            onTap: () {},
          ),
          LauncherTile(
            icon: Icons.local_pharmacy,
            title: 'Opioids',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
