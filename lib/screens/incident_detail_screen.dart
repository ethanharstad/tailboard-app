import 'package:flutter/material.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class IncidentDetailScreen extends StatelessWidget {
  final String incidentId;

  const IncidentDetailScreen({required this.incidentId, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Incident Detail",
      body: Center(
        child: Text('Detail: $incidentId'),
      ),
    );
  }

}