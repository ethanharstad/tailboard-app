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
    ),
    '2': Personnel(
      departmentId: '1',
      id: '2',
      firstName: 'Jayme',
      lastName: 'Crook',
    ),
    '3': Personnel(
      departmentId: '1',
      id: '3',
      firstName: 'Chip',
      lastName: 'Zehner',
    ),
    '4': Personnel(
      departmentId: '1',
      id: '4',
      firstName: 'Ben',
      lastName: 'Kautza',
    ),
    '5': Personnel(
      departmentId: '1',
      id: '5',
      firstName: 'Casey',
      lastName: 'Petersen',
    ),
    '6': Personnel(
      departmentId: '1',
      id: '6',
      firstName: 'Jacob',
      lastName: 'Demastus',
    ),
    '7': Personnel(
      departmentId: '1',
      id: '7',
      firstName: 'Drew',
      lastName: 'Schwering',
    ),
    '8': Personnel(
      departmentId: '1',
      id: '8',
      firstName: 'Shane',
      lastName: 'Lovig',
    ),
    '9': Personnel(
      departmentId: '1',
      id: '9',
      firstName: 'Nick',
      lastName: 'Upah',
    ),
    '10': Personnel(
      departmentId: '1',
      id: '10',
      firstName: 'Mike',
      lastName: 'Salati',
    ),
    '11': Personnel(
      departmentId: '1',
      id: '11',
      firstName: 'Ethan',
      lastName: 'Harstad',
    ),
    '12': Personnel(
      departmentId: '1',
      id: '12',
      firstName: 'Randy',
      lastName: 'Pecenka',
    ),
    '13': Personnel(
      departmentId: '1',
      id: '13',
      firstName: 'Jared',
      lastName: 'Clark',
    ),
    '14': Personnel(
      departmentId: '1',
      id: '14',
      firstName: 'Chandler',
      lastName: 'Cavanaugh',
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
