import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/screens/algorithm_list_screen.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/launcher_tile.dart';
import 'package:tailboard_app/widgets/unimplemented_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Tailboard",
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
                return const AlgorithmListScreen();
              }));
            },
          ),
          LauncherTile(
            icon: Icons.assignment,
            title: 'Tasks',
            onTap: () => showDialog<void>(context: context, builder: (BuildContext context) => const UnimplementedDialog()),
          ),
          LauncherTile(
            icon: Icons.calendar_today,
            title: 'Calendar',
            onTap: () => showDialog<void>(context: context, builder: (BuildContext context) => const UnimplementedDialog()),
          ),
          LauncherTile(
            icon: Icons.description,
            title: 'Forms',
            onTap: () => showDialog<void>(context: context, builder: (BuildContext context) => const UnimplementedDialog()),
          ),
        ],
      ),
    );
  }
}

