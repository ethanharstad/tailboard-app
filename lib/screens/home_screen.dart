import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tailboard_app/models/neris/incident.dart';
import 'package:tailboard_app/repositories/incident_repository.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/incident_list.dart';
import 'package:tailboard_app/widgets/launcher_tile.dart';
import 'package:tailboard_app/widgets/unimplemented_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final IncidentRepository incidentRepository = IncidentRepository();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.appName,
      body: ListView(children: <Widget>[
        Text(AppLocalizations.of(context)!.recentIncidents),
        StreamBuilder(stream: incidentRepository.getIncidents(), builder: (BuildContext context, AsyncSnapshot<List<Incident>> snapshot) {
          return AspectRatio(
            aspectRatio: 3,
            child: IncidentList(
              incidents: snapshot.data ?? [],
            ),
          );
        }),
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          calendarFormat: CalendarFormat.twoWeeks,
        ),
        GridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: 150,
          children: <Widget>[
            LauncherTile(
              icon: Icons.notifications_active,
              title: AppLocalizations.of(context)!.incidents,
              onTap: () {
                context.go("/incidents");
              },
            ),
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
                context.go("/medicationCalculator");
              },
            ),
            LauncherTile(
              icon: Icons.assignment,
              title: 'Tasks',
              onTap: () => showDialog<void>(
                  context: context,
                  builder: (BuildContext context) =>
                      const UnimplementedDialog()),
            ),
            LauncherTile(
              icon: Icons.calendar_today,
              title: 'Calendar',
              onTap: () => showDialog<void>(
                  context: context,
                  builder: (BuildContext context) =>
                      const UnimplementedDialog()),
            ),
            LauncherTile(
              icon: Icons.description,
              title: 'Forms',
              onTap: () => showDialog<void>(
                  context: context,
                  builder: (BuildContext context) =>
                      const UnimplementedDialog()),
            ),
            LauncherTile(
              icon: Icons.settings,
              title: 'Assets',
              onTap: () {
                context.go("/assets");
              },
            ),
            LauncherTile(
              icon: Icons.location_pin,
              title: 'Departments',
              onTap: () {
                context.goNamed("departments");
              },
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
                  ));
                }),
          ],
        ),
      ]),
    );
  }
}
