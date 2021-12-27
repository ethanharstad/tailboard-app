import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

enum Status { none, complete, choice }

const colorMap = {
  'green': Colors.green,
  'orange': Colors.orange,
  'red': Colors.red,
  'blue': Colors.blue,
  'gray': Colors.grey,
};

class BLSProtocolStepperScreen extends StatefulWidget {
  const BLSProtocolStepperScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BLSProtocolStepperScreenState();
}

class _BLSProtocolStepperScreenState extends State<BLSProtocolStepperScreen> {
  final algo = {
    "start": 1,
    "nodes": [
      {
        "id": 1,
        "label": "Verify Scene Safety",
        "color": "green",
      },
      {
        "id": 2,
        "label":
            "Check for responsiveness.\nShout for nearby help.\nActivate emergency response system via mobile device.\nGet AED and emergency equipment.",
        "color": "orange",
      },
      {
        "id": 3,
        "label":
            "Look for no breathing or only gasping and check pulse (simultaneously). Is pulse definitely felt within 10 seconds?",
        "type": "choice",
        "color": "red",
      },
      {
        "id": 4,
        "label": "Monitor until emergency responders arrive.",
        "color": "green",
      },
      {
        "id": 5,
        "label":
            "Provide rescue breathing, 1 breath every 6 seconds.\nCheck pulse every 2 minutes; if no pulse, start CPR.\nIf possible opiod overdose, administer naloxone if available per protocol.",
        "color": "green",
      },
      {
        "id": 6,
        "label":
            "Start CPR\nPerform cycles of 30 compressions and 2 breaths.\nUse AED as soon as it is available.",
        "color": "blue",
      },
      {
        "id": 7,
        "label": "AED arrives",
        "color": "gray",
      },
      {
        "id": 8,
        "label": "Check rhythm. Shockable rhythm?",
        "type": "choice",
        "color": "red",
      },
      {
        "id": 9,
        "label":
            "Give 1 shock. Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\nContinue until ALS providers take over or victim starts to move.",
        "color": "blue",
      },
      {
        "id": 10,
        "label":
            "Resume CPR immediately for 2 minutes (until prompted by AED to allow rhythm check).\nContinue until ALS providers take over or victim starts to move.",
        "color": "blue",
      },
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

  var history = [];
  int currentNode = -1;

  @override
  void initState() {
    super.initState();
    currentNode = algo['start'] as int;
  }

  Widget buildNode({
    required int id,
    Status state = Status.none,
    DateTime? time,
  }) {
    var nodes = algo['nodes'] as List;
    var node = nodes.firstWhere((element) => element['id'] == id);
    var edges =
        (algo['edges'] as List).where((element) => element['from'] == id);

    MaterialColor baseColor = colorMap[node['color']] ?? Colors.grey;
    Color color = baseColor.shade200;
    Color borderColor = baseColor.shade500;

    return Builder(
      builder: (BuildContext context) => Container(
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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(child: Text(node['label'])),
                if (time != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ],
            ),
            if (state != Status.complete)
              ButtonBar(
                children: <Widget>[
                  for (var edge in edges)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          history.add({
                            'id': currentNode,
                            'state': Status.complete,
                            'time': DateTime.now()
                          });
                          currentNode = edge['to'];
                        });
                      },
                      child: Text(edge['label'] ?? 'Next'),
                    )
                ],
              )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("$history");
    return AppScaffold(
      title: 'BLS Protocol',
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (var e in history) ...[
                buildNode(
                  id: e['id'],
                  state: e['state'] as Status,
                  time: e['time'] as DateTime,
                ),
                const SizedBox(height: 4),
              ],
              buildNode(id: currentNode),
            ],
          ),
        ),
      ),
    );
  }
}