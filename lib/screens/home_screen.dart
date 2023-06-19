import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
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
      body: ListView(
        children: <Widget>[
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: CalendarFormat.twoWeeks,
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(4),
            crossAxisCount: 3,
            children: <Widget>[
              LauncherTile(
                icon: Icons.bolt,
                title: 'Docs',
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
                onTap: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) => const UnimplementedDialog()),
              ),
              LauncherTile(
                icon: Icons.calendar_today,
                title: 'Calendar',
                onTap: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) => const UnimplementedDialog()),
              ),
              LauncherTile(
                icon: Icons.description,
                title: 'Forms',
                onTap: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) => const UnimplementedDialog()),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
