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

  @override
  Widget build(BuildContext context) {
    if(_controller.positions.isNotEmpty) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _controller.jumpTo(_controller.position.maxScrollExtent);
      });
    }
    return BlocBuilder<AlgorithmBloc, AlgorithmState>(
      builder: (BuildContext context, AlgorithmState state) {
        if (state is AlgorithmContentState) {
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
                children: <Widget>[
                  for (var transition in state.currentStep.transitions)
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<AlgorithmBloc>(context)
                          .add(AlgorithmEvent.transition(transition)),
                      child: Text(transition.body ?? 'Next'),
                    ),
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
