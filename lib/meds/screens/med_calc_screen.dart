import 'package:flutter/material.dart';
import 'package:tailboard_app/meds/widgets/patient_weight.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

import '../models/medication.dart';

class MedCalcScreen extends StatefulWidget {
  MedCalcScreen({super.key, this.initialMedication});

  Medication? initialMedication;

  @override
  State<MedCalcScreen> createState() => _MedCalcScreenState();
}

class _MedCalcScreenState extends State<MedCalcScreen> {
  Medication? medication;
  double patientWeight = 70;
  double doseRate = 0.25;
  double concentration = 50;
  double maxDose = 25;

  @override
  void initState() {
    super.initState();
    setState(() {
      medication = widget.initialMedication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Med Calculator",
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        children: <Widget>[
          Text("Patient Weight",
            style: Theme.of(context).textTheme.labelLarge,),
          PatientWeightInput(
            onChanged: (double value) {
              setState(() {
                patientWeight = value;
              });
            },
          ),
          Text(
            medication?.name ?? "Medication",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Analgesic",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Rate - ${doseRate} mg/kg'),
                          Text(
                              'Total Dose - ${(doseRate * patientWeight).toStringAsFixed(1)}'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                              'Concentration - ${concentration.toStringAsFixed(0)} mg/mL'),
                          Text(
                              'Total Volume - ${(doseRate * patientWeight / concentration).toStringAsFixed(2)} mL'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
