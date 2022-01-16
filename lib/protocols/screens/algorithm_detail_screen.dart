import 'package:flutter/material.dart';
import 'package:tailboard_app/protocols/models/algorithm.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class AlgorithmDetailScreen extends StatefulWidget {
  const AlgorithmDetailScreen({
    Key? key,
    required this.algorithm
  }) : super(key: key);

  final Algorithm algorithm;

  @override
  State<StatefulWidget> createState() => _AlgorithmDetailScreenState();
}

class _AlgorithmDetailScreenState extends State<AlgorithmDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Algorithm',
        body: Center(
          child: Text(widget.algorithm.name),
        ));
  }
}
