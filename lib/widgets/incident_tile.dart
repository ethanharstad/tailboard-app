import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tailboard_app/models/neris/incident.dart';
import 'package:tailboard_app/models/neris/incident_type.dart';
import 'package:tailboard_app/repositories/incident_type_repository.dart';

class IncidentTile extends StatelessWidget {
  final Incident incident;
  final Function(String)? onTap;
  final IncidentTypeRepository typeRepository = IncidentTypeRepository();

  IncidentTile({required this.incident, this.onTap}) : super(key: Key(incident.id));

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap == null ? null : () {
          onTap!(incident.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              Axis mainAxis = constraints.hasBoundedHeight ? Axis.vertical : Axis.horizontal;
              Axis crossAxis = constraints.hasBoundedHeight ? Axis.horizontal : Axis.vertical;
              return Flex(
                direction: mainAxis,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    direction: crossAxis,
                    spacing: 4.0,
                    children: <Widget>[
                      Text(DateFormat.yMd().format(incident.timestamp)),
                      Text(DateFormat.Hms().format(incident.timestamp)),
                    ],
                  ),
                  if(mainAxis == Axis.horizontal) const VerticalDivider(),
                  Expanded(
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        StreamBuilder(
                          stream: typeRepository.getIncidentType(incident.incidentTypeId),
                          builder: (BuildContext context, AsyncSnapshot<IncidentType?> snapshot) {
                            if(snapshot.hasData && snapshot.data != null) {
                              return Text(
                                snapshot.data!.description3,
                                softWrap: true,
                                maxLines: 2,
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        Text(incident.location.locationSummary()),
                        if(incident.location.locationDetail() != null)
                          Text(incident.location.locationDetail()!),
                        Text(incident.location.locationMunicipality()),
                      ],
                    ),
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