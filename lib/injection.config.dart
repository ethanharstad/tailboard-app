// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tailboard_app/services/firebase_service.dart' as _i3;
import 'package:tailboard_app/services/hive_service.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.factoryAsync<_i3.FirebaseService>(
      () => _i3.FirebaseService.init(),
      preResolve: true,
    );
    await gh.singletonAsync<_i4.HiveService>(
      () => _i4.HiveService.init(),
      preResolve: true,
      dispose: (i) => i.dispose(),
    );
    return this;
  }
}
