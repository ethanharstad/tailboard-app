import 'package:flutter/material.dart';

class AlgorithmListTile extends StatelessWidget {
  const AlgorithmListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.tags = const {},
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Set<String> tags;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        leading: Icon(icon, size: 48),
        subtitle: Text(tags.join(', ')),
      ),
    );
  }
}
