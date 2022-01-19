import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';
import 'package:tailboard_app/protocols/models/algorithm_transition.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_step_card.dart';

class AlgorithmStepper extends StatefulWidget {
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
  State<StatefulWidget> createState() => _AlgorithmStepperState();
}

class _AlgorithmStepperState extends State<AlgorithmStepper> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
    return ListView(
      controller: _controller,
      children: [
        for (MapEntry<DateTime, AlgorithmStep> entry in widget.history.entries)
          AlgorithmStepCard(step: entry.value, time: entry.key, complete: true,),
        AlgorithmStepCard(
          step: widget.step,
          onTransition: (AlgorithmTransition transition) => widget.onTransition(transition),
        ),
      ],
    );
  }
}

