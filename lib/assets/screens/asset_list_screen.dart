import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/assets/data/asset_repository.dart';
import 'package:tailboard_app/assets/models/asset.dart';
import 'package:tailboard_app/assets/widgets/asset_tile.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class AssetListScreen extends StatelessWidget {
  final AssetRepository assetRepository = AssetRepository();

  AssetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Assets',
      body: StreamBuilder(
        stream: assetRepository.getAssets(),
        builder: (BuildContext context, AsyncSnapshot<List<Asset>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return AssetTile(
                  asset: snapshot.data![index],
                  onTap: (String assetId) {
                    context.goNamed('asset_detail', pathParameters: {
                      'assetId': assetId,
                    });
                  },
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
