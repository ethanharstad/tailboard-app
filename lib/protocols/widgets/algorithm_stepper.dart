import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailboard_app/protocols/blocs/algorithm_bloc.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_step_card.dart';

class AlgorithmStepper extends StatefulWidget {
  const AlgorithmStepper({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlgorithmStepperState();
}

class _AlgorithmStepperState extends State<AlgorithmStepper> {
  final ScrollController _controller = ScrollController();
  late Timer _ticker;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _ticker.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlgorithmBloc, AlgorithmState>(
      listener: (BuildContext context, AlgorithmState state) {
        if (state is AlgorithmContentState) {
          if (_controller.positions.isNotEmpty) {
            _controller.jumpTo(_controller.position.maxScrollExtent);
          }
        }
      },
      builder: (BuildContext context, AlgorithmState state) {
        if (state is AlgorithmContentState) {
          var duration = now.difference(state.stepStartTime);
          return ListView(
            controller: _controller,
            children: [
              for (MapEntry<DateTime, AlgorithmStep> entry
                  in state.history.entries)
                AlgorithmStepCard(
                  step: entry.value,
                  time: entry.key,
                ),
              AlgorithmStepCard(step: state.currentStep),
              Wrap(
                spacing: 8,
                runSpacing: 0,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text(
                      '${duration.inMinutes}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}'),
                  for (var transition in state.currentStep.transitions.values)
                    duration.inSeconds >= (state.currentStep.duration ?? -1)
                        ? ElevatedButton(
                            onPressed: () =>
                                BlocProvider.of<AlgorithmBloc>(context)
                                    .add(AlgorithmEvent.transition(transition)),
                            child: Text(transition.body ?? 'Next'),
                          )
                        : OutlinedButton(
                            onPressed: () =>
                                BlocProvider.of<AlgorithmBloc>(context)
                                    .add(AlgorithmEvent.transition(transition)),
                            child: Text(transition.body ?? 'Next'),
                          )
                ],
              ),
            ],
          );
        } else if (state is AlgorithmLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('An error occurred.'),
          );
        }
      },
    );
  }
}
