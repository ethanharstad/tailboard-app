import 'package:flutter/material.dart';
import 'package:tailboard_app/screens/bls_protocol_screen.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/unimplemented_dialog.dart';

class QuickProtocolsScreen extends StatelessWidget {
  const QuickProtocolsScreen({
    Key? key,
  }) : super(key: key);

  Widget buildItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        leading: Icon(icon, size: 48),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Quick Protocols',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                FilterChip(
                  label: const Text('BLS'),
                  onSelected: (bool selected) {},
                ),
                FilterChip(
                  label: const Text('ALS'),
                  onSelected: (bool selected) {},
                ),
                FilterChip(
                  label: const Text('Adult'),
                  onSelected: (bool selected) {},
                ),
                FilterChip(
                  label: const Text('Pediatric'),
                  onSelected: (bool selected) {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(4),
              children: <Widget>[
                buildItem(
                  icon: Icons.local_hospital,
                  title: 'BLS',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const BLSProtocolScreen())),
                ),
                buildItem(
                  icon: Icons.favorite,
                  title: 'ACLS',
                  onTap: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) =>
                          const UnimplementedDialog()),
                ),
                buildItem(
                  icon: Icons.remove_circle,
                  title: 'Bradycardia',
                  onTap: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) =>
                          const UnimplementedDialog()),
                ),
                buildItem(
                  icon: Icons.add_circle,
                  title: 'Tachycardia',
                  onTap: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) =>
                          const UnimplementedDialog()),
                ),
                buildItem(
                  icon: Icons.medical_services,
                  title: 'ROSC',
                  onTap: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) =>
                          const UnimplementedDialog()),
                ),
                buildItem(
                  icon: Icons.local_pharmacy,
                  title: 'Opioids',
                  onTap: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) =>
                          const UnimplementedDialog()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
