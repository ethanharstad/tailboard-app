import 'package:tailboard_app/models/neris/station.dart';

class StationRepository {
  static final StationRepository _repository = StationRepository._internal();

  StationRepository._internal();

  factory StationRepository() {
    return _repository;
  }

  final Map<String, Station> data = {
    '1': Station(
      id: '1',
      departmentId: '1',
      name: 'Headquarters',
    ),
  };

  Stream<List<Station>> getStations(String departmentId) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield data.values
        .where((Station x) => x.departmentId == departmentId)
        .toList(growable: false);
  }

  Stream<Station?> getStation(String stationId) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield null;
    if (data.containsKey(stationId)) {
      yield data[stationId];
    }
  }
}
