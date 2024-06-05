import 'package:flutter/material.dart';
import 'package:tailboard_app/meds/widgets/patient_weight.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

import '../data/local_medication_repository.dart';
import '../data/medication_repository.dart';
import '../models/medication.dart';
import 'med_detail_screen.dart';

class MedCalcScreen extends StatefulWidget {
  const MedCalcScreen({super.key, this.initialMedication});

  final Medication? initialMedication;

  @override
  State<MedCalcScreen> createState() => _MedCalcScreenState();
}

class _MedCalcScreenState extends State<MedCalcScreen> {
  final MedicationRepository repository = LocalMedicationRepository();
  late final TextEditingController medController;
  Medication? medication;
  double patientWeight = 70;
  double doseRate = 0.25;
  double concentration = 50;
  double maxDose = 25;

  @override
  void initState() {
    super.initState();
    medController = TextEditingController(text: widget.initialMedication?.name);
    setState(() {
      medication = widget.initialMedication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Med Calculator",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Row(
              children: [
                StreamBuilder(
                  stream: repository.getMedications(),
                  builder: (BuildContext context, AsyncSnapshot<List<Medication>> snapshot) {
                    return DropdownMenu<Medication>(
                        label: const Text('Medication'),
                        width: 300,
                        initialSelection: widget.initialMedication,
                        controller: medController,
                        // enableFilter: true,
                        onSelected: (Medication? selected) {
                          setState(() {
                            medication = selected;
                          });
                        },
                        dropdownMenuEntries: <DropdownMenuEntry<Medication>>[
                          for (Medication med in snapshot.data ?? [])
                            DropdownMenuEntry(value: med, label: med.name, ),
                        ],
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.medication),
                  onPressed: medication != null ? () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => MedDetailScreen(medication: medication!)),
                  ) : null,
                ),
              ],
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
                            Text('Rate - $doseRate mg/kg (Max $maxDose)'),
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
      ),
    );
  }
}
