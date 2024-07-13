import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tailboard_app/models/neris/incident.dart';

class IncidentTile extends StatelessWidget {
  final Incident incident;
  final Function(String)? onTap;

  IncidentTile({required this.incident, this.onTap}) : super(key: Key(incident.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap == null ? null : () {
          debugPrint("onTap");
          onTap!(incident.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              Axis mainAxis = constraints.hasBoundedHeight ? Axis.vertical : Axis.horizontal;
              Axis crossAxis = constraints.hasBoundedHeight ? Axis.horizontal : Axis.vertical;
              return Wrap(
                direction: mainAxis,
                children: <Widget>[
                  Wrap(
                    direction: crossAxis,
                    children: <Widget>[
                      Text(DateFormat.yMd().format(incident.timestamp)),
                      Text(DateFormat.jms().format(incident.timestamp)),
                    ],
                  ),
                  if(mainAxis == Axis.horizontal) const VerticalDivider(),
                  Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      const Text("INCIDENT TYPE"),
                      Text(incident.location.locationSummary()),
                      if(incident.location.locationDetail() != null)
                        Text(incident.location.locationDetail()!),
                      Text(incident.location.locationMunicipality()),
                    ],
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

}