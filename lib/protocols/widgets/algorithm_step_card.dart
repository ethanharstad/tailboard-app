import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';

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
    this.complete = false,
    this.time,
  }) : super(key: key);

  final AlgorithmStep step;
  final bool complete;
  final DateTime? time;

  @override
  Widget build(BuildContext context) {
    MaterialColor baseColor = colorMap[step.color] ?? Colors.grey;
    Color color = baseColor.shade200;
    Color borderColor = baseColor.shade500;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      child: Column(
        children: <Widget>[
          Row(
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
          if (!complete)
            ButtonBar(
              children: <Widget>[
                for (var transition in step.transitions)
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(transition.body ?? 'Next'),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
