import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
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
    this.time,
  }) : super(key: key);

  final AlgorithmStep step;
  final DateTime? time;

  @override
  Widget build(BuildContext context) {
    MaterialColor baseColor = colorMap[step.color] ?? Colors.grey;
    // TODO card color/style tweaks
    Color color = baseColor.shade200;
    // Color borderColor = baseColor.shade500;

    return Card(
      color: color,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: StyledText(
                      text: step.body,
                      tags: {
                        'bold': StyledTextTag(
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        'italic': StyledTextTag(
                            style:
                                const TextStyle(fontStyle: FontStyle.italic)),
                      },
                    ),
                  ),
                  // TODO add inline actions like drug calc or noteref
                  if (step.label != null || time != null) ...[
                    const VerticalDivider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        if (step.label != null)
                          Text(
                            step.label!,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        if (time != null)
                          Text(
                            "${time?.hour.toString().padLeft(2, '0')}:${time?.minute.toString().padLeft(2, '0')}",
                            style: Theme.of(context).textTheme.caption,
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
