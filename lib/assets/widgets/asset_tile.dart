import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tailboard_app/assets/models/asset.dart';

class AssetTile extends StatelessWidget {
  final Asset asset;
  final Function(String)? onTap;

  const AssetTile({required this.asset, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap == null
            ? null
            : () {
                onTap!(asset.id);
              },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                asset.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if(asset.make != null || asset.model != null)
                Text([asset.make, asset.model].whereNotNull().join(" ")),
            ],
          ),
        ),
      ),
    );
  }
}
