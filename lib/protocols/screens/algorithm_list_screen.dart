import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm.dart';
import 'package:tailboard_app/protocols/screens/algorithm_detail_screen.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_list_tile.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/protocols/data/firebase_algorithm_repository.dart';

class AlgorithmListScreen extends StatefulWidget {
  const AlgorithmListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlgorithmListScreenState();
}

class _AlgorithmListScreenState extends State<AlgorithmListScreen> {
  Set<String> selected = {};
  final Set<String> filters = {
    'BLS',
    'ALS',
    'Adult',
    'Pediatric',
  };
  final FirebaseAlgorithmRepository repository = FirebaseAlgorithmRepository();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Quick Protocols',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                // Iterate over all the possible filters
                for (String filter in filters)
                  // Display a boolean chip
                  FilterChip(
                    label: Text(filter),
                    // Selected if it exists in the selected list
                    selected: selected.contains(filter),
                    // Update selected list based on state
                    onSelected: (bool value) {
                      setState(() {
                        if (value) {
                          selected.add(filter);
                        } else {
                          selected.remove(filter);
                        }
                      });
                    },
                  ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Algorithm>>(
              stream: repository.getAlgorithms(),
              builder: (BuildContext context, AsyncSnapshot<List<Algorithm>> snapshot) {
                if(snapshot.hasError) {
                  return const Center(
                    child: Text("Loading"),
                  );
                }
                return ListView(
                  padding: const EdgeInsets.all(4),
                  children: <Widget>[
                    // Iterate over all the algorithms
                    for (Algorithm algorithm in snapshot.data ?? [])
                      // Only show if there is no selected filter or it matches any
                      if (selected.isEmpty || algorithm.tags.any(selected.contains))
                        AlgorithmListTile(
                          icon: Icons.error,
                          title: algorithm.name,
                          tags: algorithm.tags,
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AlgorithmDetailScreen(algorithm: algorithm),
                          )),
                        ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
