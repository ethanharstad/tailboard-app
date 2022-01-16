import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';
import 'package:tailboard_app/protocols/models/algorithm_transition.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_step_card.dart';

class AlgorithmStepper extends StatelessWidget {
  const AlgorithmStepper({
    Key? key,
    required this.step,
    required this.history,
    required this.onTransition,
  }) : super(key: key);

  final AlgorithmStep step;
  final LinkedHashMap<DateTime, AlgorithmStep> history;
  final Function(AlgorithmTransition transition) onTransition;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (MapEntry<DateTime, AlgorithmStep> entry in history.entries)
          AlgorithmStepCard(step: entry.value, time: entry.key, complete: true,),
        AlgorithmStepCard(
          step: step,
          onTransition: (AlgorithmTransition transition) => onTransition(transition),
        ),
      ],
    );
  }
}

