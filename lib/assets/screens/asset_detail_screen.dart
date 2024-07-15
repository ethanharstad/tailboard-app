import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tailboard_app/assets/data/asset_repository.dart';
import 'package:tailboard_app/assets/models/asset.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class AssetDetailScreen extends StatelessWidget {
  final AssetRepository assetRepository = AssetRepository();
  final String assetId;

  AssetDetailScreen({required this.assetId, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Asset Detail",
      body: StreamBuilder(
        stream: assetRepository.getAsset(assetId),
        builder: (BuildContext context, AsyncSnapshot<Asset?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              Asset asset = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if(asset.make != null || asset.model != null)
                    Text([asset.make, asset.model].whereNotNull().join(" ")),
                ],
              );
            }
            return const Center(
              child: Text("Asset Not Found"),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
