import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';
import 'package:tailboard_app/protocols/models/algorithm_transition.dart';

const colorMap = {
  'green': Colors.green,
  'orange': Colors.orange,
  'red': Colors.red,
  'blue': Colors.blue,
  'gray': Colors.grey,
};

class AlgorithmStepCard extends StatelessWidget {
  const AlgorithmStepCard({
    Key? key,
    required this.step,
    this.onTransition,
    this.complete = false,
    this.time,
  }) : super(key: key);

  final AlgorithmStep step;
  final bool complete;
  final DateTime? time;
  final Function(AlgorithmTransition transition)? onTransition;

  @override
  Widget build(BuildContext context) {
    MaterialColor baseColor = colorMap[step.color] ?? Colors.grey;
    // TODO card color/style tweaks
    Color color = baseColor.shade200;
    Color borderColor = baseColor.shade500;

    return Card(
      color: color,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: Text(step.body)),
                if (time != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    "${time?.hour.toString().padLeft(2, '0')}:${time?.minute.toString().padLeft(2, '0')}",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ],
            ),
          ),
          if (!complete)
            Wrap(
              spacing: 8,
              runSpacing: 0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                for (var transition in step.transitions)
                  ElevatedButton(
                    onPressed: () => onTransition!(transition),
                    child: Text(transition.body ?? 'Next'),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
