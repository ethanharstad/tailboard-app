import 'package:flutter/material.dart';
import 'package:tailboard_app/screens/bls_protocol_graph_screen.dart';
import 'package:tailboard_app/screens/bls_protocol_pdf_screen.dart';
import 'package:tailboard_app/screens/bls_protocol_stepper_screen.dart';
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
            title: 'BLS (Graph)',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const BLSProtocolGraphScreen();
              }));
            },
          ),
          LauncherTile(
            icon: Icons.local_hospital,
            title: 'BLS (PDF)',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return BLSProtocolPdfScreen();
              }));
            },
          ),
          LauncherTile(
            icon: Icons.local_hospital,
            title: 'BLS (Steps)',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const BLSProtocolStepperScreen();
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
