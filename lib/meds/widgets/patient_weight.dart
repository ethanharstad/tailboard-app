import 'package:flutter/material.dart';

class PatientWeightInput extends StatefulWidget {
  void Function(double) onChanged;

  PatientWeightInput({super.key, required this.onChanged});

  @override
  State<PatientWeightInput> createState() => _PatientWeightInputState();
}

class _PatientWeightInputState extends State<PatientWeightInput> {
  double patientWeight = 70.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Slider(
            min: 0,
            max: 200,
            value: patientWeight,
            label: patientWeight.round().toString(),
            onChanged: (double value) {
              setState(() {
                patientWeight = value;
                widget.onChanged(value);
              });
            },
          ),
        ),
        Column(
          children: [
            Text('${patientWeight.toStringAsFixed(1)} kg'),
            Text('${(patientWeight * 2.20462).toStringAsFixed(0)} lbs'),
          ],
        ),
        const SizedBox(width: 4.0),
        IconButton.outlined(
          icon: const Icon(Icons.question_mark),
          onPressed: () {},
        ),
      ],
    );
  }
}