import 'package:flutter/material.dart';
import 'package:tailboard_app/screens/quick_protocols_screen.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/launcher_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.title,
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 2,
        children: <Widget>[
          LauncherTile(
            icon: Icons.bolt,
            title: 'Quick Protocols',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const QuickProtocolsScreen();
              }));
            },
          ),
          LauncherTile(
            icon: Icons.assignment,
            title: 'Tasks',
            onTap: () {},
          ),
          LauncherTile(
            icon: Icons.calendar_today,
            title: 'Calendar',
            onTap: () {},
          ),
          LauncherTile(
            icon: Icons.description,
            title: 'Forms',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
