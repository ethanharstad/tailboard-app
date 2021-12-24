import 'package:flutter/material.dart';

class LauncherTile extends StatelessWidget {
  const LauncherTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(icon, size: 64),
            const SizedBox(height: 4),
            Text(title, style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}
