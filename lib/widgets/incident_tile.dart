import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tailboard_app/models/neris/incident.dart';

class IncidentTile extends StatelessWidget {
  final Incident incident;
  final VoidCallback? onTap;

  IncidentTile({required this.incident, this.onTap}) : super(key: Key(incident.id));

  @override
  Widget build(BuildContext context) {
    // TODO Update IncidentTile to handle aspect ratio differences
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(DateFormat.yMd().format(incident.timestamp)),
                Text(DateFormat.jms().format(incident.timestamp)),
              ],
            ),
            const VerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("INCIDENT TYPE"),
                Text(incident.location.locationSummary()),
                if(incident.location.locationDetail() != null)
                  Text(incident.location.locationDetail()!),
                Text(incident.location.locationMunicipality()),
              ],
            ),
            if(onTap != null)
              const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

}