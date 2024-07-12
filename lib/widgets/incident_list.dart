import 'package:flutter/material.dart';

import 'package:tailboard_app/widgets/incident_tile.dart';
import 'package:tailboard_app/models/neris/incident.dart';

class IncidentList extends StatelessWidget {
  final List<Incident> incidents;

  const IncidentList({super.key, required this.incidents});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        Axis mainAxis = constraints.maxHeight > constraints.maxWidth ? Axis.vertical : Axis.horizontal;
        return ListView(
          scrollDirection: mainAxis,
          children: <Widget>[
            for(Incident incident in incidents)
              IncidentTile(incident: incident),
          ],
        );
      },
    );
  }

}