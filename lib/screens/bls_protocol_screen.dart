import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class BLSProtocolScreen extends StatefulWidget {
  const BLSProtocolScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BLSProtocolsScreenState();
}

class _BLSProtocolsScreenState extends State<BLSProtocolScreen> {
  var algo = {
    "nodes": [
      {"id": 1, "label": "Verify Scene Safety"},
      {"id": 2, "label": "Check for responsiveness"},
      {
        "id": 3,
        "label": "Look for breathing and check pulse.",
        "type": "choice"
      },
      {"id": 4, "label": "Monitor until emergency responders arrive."},
      {"id": 5, "label": "Provide rescue breathing: 1 breath every 6 seconds."},
      {"id": 6, "label": "Start CPR"},
      {"id": 7, "label": "AED arrives"},
      {"id": 8, "label": "Check rhythm. Shockable rhythm?", "type": "choice"},
      {"id": 9, "label": "Give 1 shock."},
      {"id": 10, "label": "Resume CPR immediately for 2 minutes."},
    ],
    "edges": [
      {"from": 1, "to": 2},
      {"from": 2, "to": 3},
      {"from": 3, "to": 4, "label": "Normal breathing, pulse felt"},
      {"from": 3, "to": 5, "label": "Abnormal breathing, pulse felt"},
      {"from": 3, "to": 6, "label": "No breathing, pulse not felt"},
      {"from": 6, "to": 7},
      {"from": 7, "to": 8},
      {"from": 8, "to": 9, "label": "Yes, shockable"},
      {"from": 9, "to": 8},
      {"from": 8, "to": 10, "label": "No, nonshockable"},
      {"from": 10, "to": 8},
    ],
  };

  final Graph graph = Graph()..isTree = true;
  SugiyamaConfiguration builder = SugiyamaConfiguration();

  Widget rectangleWidget(String label) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(label),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    algo['edges']?.forEach((element) {
      var fromNodeId = element['from'];
      var toNodeId = element['to'];
      graph.addEdge(Node.Id(fromNodeId), Node.Id(toNodeId));
    });

    builder
      ..nodeSeparation = 40
      ..levelSeparation = 50
      ..orientation = SugiyamaConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'BLS Protocol',
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: InteractiveViewer(
            constrained: false,
            minScale: 0.01,
            child: GraphView(
              algorithm: SugiyamaAlgorithm(builder),
              graph: graph,
              builder: (Node node) {
                var a = node.key!.value as int;
                var nodes = algo['nodes'];
                var nodeValue =
                    nodes!.firstWhere((element) => element['id'] == a);
                return rectangleWidget(nodeValue['label'] as String);
              },
            ),
          ),
        ),
      ),
    );
  }
}
