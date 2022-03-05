import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:tailboard_app/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);