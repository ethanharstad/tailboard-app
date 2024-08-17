import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigRepository {
  RemoteConfigRepository._();

  static FirebaseRemoteConfig? _remoteConfig;
  static final RemoteConfigRepository _repository = RemoteConfigRepository._();

  factory RemoteConfigRepository() {
    if (_remoteConfig == null) {
      print('in initializer');
      _remoteConfig = FirebaseRemoteConfig.instance;
      _remoteConfig!.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));
    }
    return _repository;
  }

  Future<void> update() async {
    _remoteConfig!.fetchAndActivate();
  }

  String getMinimumVersion() {
    return _remoteConfig!.getString('app_minimum_version');
  }
}
