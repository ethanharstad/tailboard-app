import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm_note.dart';

class AlgorithmNoteCard extends StatelessWidget {
  const AlgorithmNoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  final AlgorithmNote note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (note.title?.isNotEmpty ?? false)
              Text(
                note.title!,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            Text(note.body),
          ],
        ),
      ),
    );
  }
}
