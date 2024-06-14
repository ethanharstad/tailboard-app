import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tailboard_app/meds/screens/med_calc_screen.dart';
import 'package:tailboard_app/protocols/screens/algorithm_list_screen.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/launcher_tile.dart';
import 'package:tailboard_app/widgets/unimplemented_dialog.dart';

import '../meds/screens/med_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          GridView.extent(
            shrinkWrap: true,
            padding: const EdgeInsets.all(4),
            maxCrossAxisExtent: 200,
            children: <Widget>[
              LauncherTile(
                icon: Icons.bolt,
                title: 'Docs',
                onTap: () {
                  context.go("/protocols");
                },
              ),
              LauncherTile(
                icon: Icons.medication,
                title: 'Meds',
                onTap: () {
                  context.go("/medications");
                },
              ),
              LauncherTile(
                icon: Icons.calculate,
                title: 'Med Calc',
                onTap: () {
                  context.go("/medication_calculator");
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
              LauncherTile(
                  icon: Icons.notification_important,
                  title: 'Notification Test',
                  onTap: () {
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                          id: 10,
                          channelKey: 'basic_channel',
                          actionType: ActionType.Default,
                          title: 'Hello World!',
                          body: 'This is my first notification!',
                        )
                    );
                  }),
            ],
          ),
        ]
      ),
    );
  }
}
