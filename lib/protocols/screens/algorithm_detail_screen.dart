import 'package:flutter/material.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class AlgorithmDetailScreen extends StatefulWidget {
  const AlgorithmDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlgorithmDetailScreenState();
}

class _AlgorithmDetailScreenState extends State<AlgorithmDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Algorithm',
        body: Center(
          child: Text('blah'),
        ));
  }
}
