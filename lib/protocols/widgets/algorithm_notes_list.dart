import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm_note.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_note_card.dart';

class AlgorithmNotesList extends StatelessWidget {
  const AlgorithmNotesList({
    super.key,
    this.notes = const {},
  });

  final Map<String, AlgorithmNote> notes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (AlgorithmNote note in notes.values.sorted())
          AlgorithmNoteCard(note: note),
      ],
    );
  }
}
