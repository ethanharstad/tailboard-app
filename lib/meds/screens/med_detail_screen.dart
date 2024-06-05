import 'package:flutter/material.dart';
import 'package:tailboard_app/meds/models/medication.dart';
import 'package:tailboard_app/meds/screens/med_calc_screen.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class MedDetailScreen extends StatelessWidget {
  const MedDetailScreen({super.key, required this.medication});

  final Medication medication;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Med Detail",
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.calculate),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => MedCalcScreen(initialMedication: medication)),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Text(medication.id),
          Text(medication.name),
          const Text('Generic Names'),
        ],
      ),
    );
  }
}
