import 'package:flutter/material.dart';

import '../models/height.dart';

class PatientHeightInput extends StatefulWidget {
  final void Function(double) onChanged;

  const PatientHeightInput({super.key, required this.onChanged});

  @override
  State<PatientHeightInput> createState() => _PatientHeightInput();
}

class _PatientHeightInput extends State<PatientHeightInput> {
  late Height patientHeight;

  @override
  void initState() {
    patientHeight = const Height(1.7);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Slider(
            min: 0,
            max: 2.2,
            value: patientHeight.value,
            onChanged: (double value) {
              setState(() {
                patientHeight = Height(value);
                widget.onChanged(value);
              });
            },
          ),
        ),
        Column(
          children: <Widget>[
            Text(patientHeight.formatCm()),
            Text(patientHeight.formatFI()),
          ],
        ),
      ],
    );
  }
}

