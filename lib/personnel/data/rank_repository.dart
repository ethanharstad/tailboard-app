import 'package:tailboard_app/personnel/models/rank.dart';

class RankRepository {
  static final RankRepository _singleton = RankRepository._internal();

  RankRepository._internal();

  factory RankRepository() {
    return _singleton;
  }

  final Map<String, Rank> data = {
    '1': Rank(
      departmentId: '1',
      id: '1',
      rankOrder: 1,
      name: 'Chief',
      abbreviation: 'Chf',
    ),
    '10': Rank(
      departmentId: '1',
      id: '10',
      rankOrder: 10,
      name: 'Captain',
      abbreviation: 'Cpt',
    ),
    '30': Rank(
      departmentId: '1',
      id: '30',
      rankOrder: 30,
      name: 'Firefighter/Paramedic',
      abbreviation: "FF/PM",
    ),
    '31': Rank(
      departmentId: '1',
      id: '31',
      rankOrder: 31,
      name: 'Firefighter/EMT',
      abbreviation: 'FF/EMT',
    ),
    '40': Rank(
      departmentId: '1',
      id: '40',
      rankOrder: 40,
      name: 'Firefighter/Paramedic (Part Time)',
      abbreviation: 'FF/PM (PRN)',
    ),
    '41': Rank(
      departmentId: '1',
      id: '41',
      rankOrder: 41,
      name: 'Firefighter/EMT (Part Time)',
      abbreviation: 'FF/EMT (PRN)',
    ),
    '51': Rank(
      departmentId: '1',
      id: '51',
      rankOrder: 51,
      name: 'Firefighter/EMT (POC)',
      abbreviation: 'FF/EMT (POC)',
    ),
    '52': Rank(
      departmentId: '1',
      id: '52',
      rankOrder: 52,
      name: 'Firefighter (POC)',
      abbreviation: 'FF (POC)',
    ),
    '52': Rank(
      departmentId: '1',
      id: '52',
      rankOrder: 52,
      name: 'Firefighter (POC)',
      abbreviation: 'FF (POC)',
    ),
    '60': Rank(
      departmentId: '1',
      id: '60',
      rankOrder: 60,
      name: 'Probationary',
      abbreviation: 'Prob',
    ),
  };

  Stream<List<Rank>> getDepartmentRanks(String departmentId) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield data.values.toList(growable: false);
  }

  Stream<Rank?> getRank(String rankId) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield null;
    if (data.containsKey(rankId)) {
      yield data[rankId];
    }
  }
}