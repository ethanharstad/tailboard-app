import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm_note.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_note_card.dart';

class AlgorithmDrawer extends StatelessWidget {
  const AlgorithmDrawer({
    Key? key,
    this.notes = const [],
  }) : super(key: key);

  final List<AlgorithmNote> notes;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        children: <Widget>[
          for (AlgorithmNote note in notes)
            AlgorithmNoteCard(note: note),
        ],
      ),
    );
  }
}