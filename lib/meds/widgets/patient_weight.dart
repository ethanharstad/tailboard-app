import 'package:flutter/material.dart';
import 'package:tailboard_app/meds/widgets/patient_height.dart';

import '../models/weight.dart';

class PatientWeightInput extends StatefulWidget {
  void Function(double) onChanged;

  PatientWeightInput({super.key, required this.onChanged});

  @override
  State<PatientWeightInput> createState() => _PatientWeightInputState();
}

class _PatientWeightInputState extends State<PatientWeightInput> {
  late Weight patientWeight;
  bool estimate = false;

  @override
  void initState() {
    patientWeight = Weight(70);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Slider(
                min: 0,
                max: 200,
                value: patientWeight.value,
                onChanged: (double value) {
                  setState(() {
                    patientWeight = Weight(value);
                    widget.onChanged(value);
                  });
                },
              ),
            ),
            Column(
              children: [
                Text(patientWeight.formatKg()),
                Text(patientWeight.formatLb()),
              ],
            ),
            const SizedBox(width: 4.0),
            IconButton.outlined(
              icon: const Icon(Icons.straighten),
              onPressed: () {
                setState(() {
                  estimate = !estimate;
                });
              },
            ),
          ],
        ),
        if (estimate) ...[
          const Center(child: Text('Estimated from height using Corpulence Index of 13')),
          Text('Patient Height',style: Theme.of(context).textTheme.labelMedium),
          PatientHeightInput(
            onChanged: (double value) {
              setState(() {
                patientWeight = Weight.fromHeight(value);
              });
            },
          ),
        ]
      ],
    );
  }
}