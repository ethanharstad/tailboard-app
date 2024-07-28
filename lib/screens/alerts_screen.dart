import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tailboard_app/models/alert.dart';
import 'package:tailboard_app/repositories/alert_repository.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class AlertsScreen extends StatelessWidget {
  final AlertRepository repository = AlertRepository();

  AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.alerts,
      body: StreamBuilder(
        stream: repository.getAlerts(),
        builder: (BuildContext context, AsyncSnapshot<List<Alert>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView(
                children: [
                  for (Alert alert in snapshot.data!)
                    ListTile(
                      title: Text(
                        alert.title,
                        style: alert.unread ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                ],
              );
            }
            return const Text('No alerts.');
          }
          return const Text('Loading');
        },
      ),
    );
  }
}
