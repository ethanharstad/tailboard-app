import 'package:flutter/material.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

import 'package:tailboard_app/repositories/incident_repository.dart';
import 'package:tailboard_app/models/neris/incident.dart';
import 'package:tailboard_app/widgets/incident_list.dart';

class IncidentListScreen extends StatelessWidget {
  final IncidentRepository incidentRepository = IncidentRepository();

  IncidentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Incidents",
      body: StreamBuilder(stream: incidentRepository.getIncidents(), builder: (BuildContext context, AsyncSnapshot<List<Incident>> snapshot) {
        return IncidentList(
          incidents: snapshot.data ?? [],
        );
      }),
    );
  }
}