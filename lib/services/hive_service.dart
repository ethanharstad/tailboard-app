import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class HiveService {
  @FactoryMethod(preResolve: true)
  static Future<HiveService> init() async {
    await Hive.initFlutter();

    return HiveService();
  }

  @disposeMethod
  void dispose() {
    Hive.close();
  }
}