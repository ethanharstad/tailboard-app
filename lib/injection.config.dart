// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tailboard_app/services/firebase_service.dart' as _i1038;
import 'package:tailboard_app/services/hive_service.dart' as _i882;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.factoryAsync<_i1038.FirebaseService>(
      () => _i1038.FirebaseService.init(),
      preResolve: true,
    );
    await gh.singletonAsync<_i882.HiveService>(
      () => _i882.HiveService.init(),
      preResolve: true,
      dispose: (i) => i.dispose(),
    );
    return this;
  }
}
