
import 'package:flutter/material.dart';
import 'package:tailboard_app/widgets/incident_tile.dart';

import '../models/neris/incident.dart';

class IncidentList extends StatelessWidget {
  final String? title;
  final List<Incident> incidents;

  const IncidentList({super.key, required this.incidents, this.title});

  @override
  Widget build(BuildContext context) {
    // TODO Update IncidentList to handle aspect ratio differences
    return Column(
      children: [
        if(title?.isNotEmpty ?? false)
          Text(title!),
        AspectRatio(
          aspectRatio: 3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for(Incident incident in incidents)
                IncidentTile(incident: incident),
            ],
          ),
        ),
      ],
    );
  }

}