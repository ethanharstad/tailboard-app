import 'package:tailboard_app/personnel/models/personnel.dart';

class PersonnelRepository {
  static final PersonnelRepository _repository =
      PersonnelRepository._internal();

  PersonnelRepository._internal();

  factory PersonnelRepository() {
    return _repository;
  }

  final Map<String, Personnel> data = {
    '1': Personnel(
      departmentId: '1',
      id: '1',
      firstName: 'Justin',
      lastName: 'Adams',
      rankId: '1',
      serviceStart: DateTime(1999, 8, 17),
      rankStart: DateTime(2009, 12, 1),
    ),
    '2': Personnel(
      departmentId: '1',
      id: '2',
      firstName: 'Jayme',
      lastName: 'Crook',
      rankId: '10',
      serviceStart: DateTime(2008, 4, 26),
      rankStart: DateTime(2021, 11, 15),
    ),
    '3': Personnel(
      departmentId: '1',
      id: '3',
      firstName: 'Chip',
      lastName: 'Zehner',
      rankId: '10',
      serviceStart: DateTime(2002, 2, 13),
      rankStart: DateTime(2011, 5, 1),
    ),
    '4': Personnel(
      departmentId: '1',
      id: '4',
      firstName: 'Ben',
      lastName: 'Kautza',
      rankId: '10',
      serviceStart: DateTime(2010, 4, 15),
      rankStart: DateTime(2014, 8, 12),
    ),
    '5': Personnel(
      departmentId: '1',
      id: '5',
      firstName: 'Casey',
      lastName: 'Petersen',
      rankId: '30',
      serviceStart: DateTime(2016, 7, 1),
      rankStart: DateTime(2020, 3, 1),
    ),
    '6': Personnel(
      departmentId: '1',
      id: '6',
      firstName: 'Jacob',
      lastName: 'Demastus',
      rankId: '30',
      serviceStart: DateTime(2018, 6, 1),
      rankStart: DateTime(2021, 7, 5),
    ),
    '7': Personnel(
      departmentId: '1',
      id: '7',
      firstName: 'Drew',
      lastName: 'Schwering',
      rankId: '31',
      serviceStart: DateTime(2023, 5, 15),
      rankStart: DateTime(2024, 6, 18),
    ),
    '8': Personnel(
      departmentId: '1',
      id: '8',
      firstName: 'Shane',
      lastName: 'Lovig',
      rankId: '30',
      serviceStart: DateTime(2014, 6, 1),
      rankStart: DateTime(2017, 9, 1),
    ),
    '9': Personnel(
      departmentId: '1',
      id: '9',
      firstName: 'Nick',
      lastName: 'Upah',
      rankId: '31',
      serviceStart: DateTime(2021, 3, 1),
      rankStart: DateTime(2022, 8, 1),
    ),
    '10': Personnel(
      departmentId: '1',
      id: '10',
      firstName: 'Mike',
      lastName: 'Salati',
      rankId: '31',
      serviceStart: DateTime(2023, 7, 1),
      rankStart: DateTime(2024, 6, 18),
    ),
    '11': Personnel(
      departmentId: '1',
      id: '11',
      firstName: 'Ethan',
      lastName: 'Harstad',
      rankId: '41',
      serviceStart: DateTime(2017, 9, 1),
      rankStart: DateTime(2019, 2, 16),
    ),
    '12': Personnel(
      departmentId: '1',
      id: '12',
      firstName: 'Randy',
      lastName: 'Pecenka',
      rankId: '41',
      serviceStart: DateTime(2019, 9, 15),
      rankStart: DateTime(2019, 9, 15),
    ),
    '13': Personnel(
      departmentId: '1',
      id: '13',
      firstName: 'Jared',
      lastName: 'Clark',
      rankId: '51',
      serviceStart: DateTime(2015, 1, 15),
      rankStart: DateTime(2015, 1, 15),
    ),
    '14': Personnel(
      departmentId: '1',
      id: '14',
      firstName: 'Chandler',
      lastName: 'Cavanaugh',
      rankId: '60',
      serviceStart: DateTime(2024, 3, 1),
      rankStart: DateTime(2024, 3, 1),
    ),
    '15': Personnel(
      departmentId: '1',
      id: '15',
      firstName: 'Hannah',
      lastName: 'Derry',
      rankId: '53',
      serviceStart: DateTime(2023, 10, 2),
      rankStart: DateTime(2023, 10, 2),
    ),
  };

  Stream<List<Personnel>> getDepartmentPersonnel(String departmentId) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield data.values.toList(growable: false);
  }

  Stream<Personnel?> getPersonnel(String personnelId) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield null;
    if (data.containsKey(personnelId)) {
      yield data[personnelId];
    }
  }
}
