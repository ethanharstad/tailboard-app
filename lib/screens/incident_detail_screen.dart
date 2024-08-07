import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/repositories/incident_repository.dart';
import 'package:tailboard_app/repositories/incident_type_repository.dart';
import 'package:tailboard_app/models/neris/incident.dart';
import 'package:tailboard_app/models/neris/incident_type.dart';

class IncidentDetailScreen extends StatelessWidget {
  final IncidentRepository incidentRepository = IncidentRepository();
  final IncidentTypeRepository typeRepository = IncidentTypeRepository();
  final String incidentId;

  IncidentDetailScreen({required this.incidentId, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Incident Detail",
      body: StreamBuilder(
        stream: incidentRepository.getIncident(incidentId),
        builder: (BuildContext context, AsyncSnapshot<Incident?> snapshot) {
          if(snapshot.hasData) {
            if(snapshot.data != null) {
              Incident incident = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const AspectRatio(
                    aspectRatio: 4/3,
                    child: Placeholder(
                      child: Center(child: Text('Map')),
                    ),
                  ),
                  StreamBuilder(
                    stream: typeRepository.getIncidentType(incident.incidentTypeId),
                    builder: (BuildContext context, AsyncSnapshot<IncidentType?> snapshot) {
                      if(snapshot.hasData && snapshot.data != null) {
                        return Text(
                          snapshot.data!.description3,
                          softWrap: true,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headlineSmall,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  Text("Incident Number: ${incident.incidentNumber}"),
                  Text("Created: ${DateFormat.yMd().add_Hms().format(incident.timestamp)}"),
                  const Text("Location:"),
                  Text(incident.location.locationSummary()),
                  if(incident.location.locationDetail() != null)
                    Text(incident.location.locationDetail()!),
                  Text(incident.location.locationMunicipality()),
                ],
              );
            }
            return const Center(
              child: Text('No Incident Found'),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

}