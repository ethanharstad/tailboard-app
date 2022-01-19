import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm.dart';
import 'package:tailboard_app/protocols/screens/algorithm_detail_screen.dart';
import 'package:tailboard_app/protocols/widgets/algorithm_list_tile.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/protocols/data/algorithms.dart';

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
            child: ListView(
              padding: const EdgeInsets.all(4),
              children: <Widget>[
                // Iterate over all the algorithms
                for (Algorithm algorithm in algorithms)
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
            ),
          ),
        ],
      ),
    );
  }
}
