import 'package:flutter/material.dart';

class AlgorithmListTile extends StatelessWidget {
  const AlgorithmListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        leading: Icon(icon, size: 48),
      ),
    );
  }
}
