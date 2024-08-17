import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:tailboard_app/models/alert.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

import '../blocs/alert_cubit.dart';

class AlertsScreen extends StatelessWidget {
  // final AlertRepository repository = AlertRepository();

  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.alerts,
      body: BlocBuilder<AlertCubit, AlertCubitState>(
        builder: (BuildContext context, AlertCubitState state) {
          switch (state) {
            case Loading():
              return Center(
                child: Column(
                  children: [
                    const CircularProgressIndicator(),
                    Text(AppLocalizations.of(context)!.loading),
                  ],
                ),
              );
            case Data(:final alerts):
              if (alerts.isEmpty) {
                return const Center(
                    child: Text('No Alerts.'),
                );
              }
              return ListView(
                children: [
                  for (Alert alert in alerts)
                    ListTile(
                      trailing: Column(
                        children: [
                          Text(DateFormat.yMd().format(alert.created)),
                          Text(DateFormat.Hms().format(alert.created)),
                        ],
                      ),
                      title: Text(
                        alert.title,
                        style: alert.unread ? Theme
                            .of(context)
                            .textTheme
                            .titleMedium : Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                      onTap: () {
                        context.read<AlertCubit>().alertRead(alert);
                      },
                    ),
                ],
              );
            case Error(:final message):
              return Center(
                child: Column(
                  children: [
                    const Text('Error loading alerts.'),
                    Text(message)
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
