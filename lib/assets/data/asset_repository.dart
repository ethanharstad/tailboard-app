import 'package:tailboard_app/assets/models/asset.dart';

class AssetRepository {
  // Singleton instance
  static final AssetRepository _repository = AssetRepository._internal();

  // Private internal constructor
  AssetRepository._internal();

  // Always return singleton instance
  factory AssetRepository() {
    return _repository;
  }

  final Map<String, Asset> assets = {
    '1': Asset(
      id: '1',
      name: 'Engine 65',
      make: 'Pierce',
      model: 'Impel',
    ),
    '2': Asset(
      id: '2',
      name: 'Command 64',
      make: 'Chevrolet',
      model: 'Silverado 1500',
    ),
  };

  Stream<List<Asset>> getAssets() async* {
    await Future.delayed(const Duration(seconds: 2));
    yield [];
    await Future.delayed(const Duration(seconds: 2));
    yield assets.values.toList(growable: false);
  }

  Stream<Asset?> getAsset(String id) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield null;
    if(assets.containsKey(id)) {
      await Future.delayed(const Duration(seconds: 1));
      yield assets[id];
    }
  }
}