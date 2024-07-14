import 'package:tailboard_app/models/neris/incident_type.dart';

class IncidentTypeRepository {
  static final IncidentTypeRepository _repository = IncidentTypeRepository._internal();

  IncidentTypeRepository._internal();

  factory IncidentTypeRepository() {
    return _repository;
  }

  final Map<String, IncidentType> _types = {
    '1': const IncidentType(
      id: '1',
      value1: 'FIRE',
      description1: 'Fire',
      value2: 'OUTSIDE_FIRE',
      description2: 'Outside Fire',
      value3: 'VEGETATION_GRASS_FIRE',
      description3: 'Vegetation / Grass Fire',
    ),
    '2': const IncidentType(
      id: '2',
      value1: 'FIRE',
      description1: 'Fire',
      value2: 'STRUCTURE_FIRE',
      description2: 'Structure Fire',
      value3: 'ROOM_AND_CONTENTS_FIRE',
      description3: 'Room and Contents Fire',
    ),
    '3': const IncidentType(
      id: '3',
      value1: 'MEDICAL',
      description1: 'Medical',
      value2: 'ILLNESS',
      description2: 'Illness',
      value3: 'SICK_CASE',
      description3: 'Sick Case',
    ),
    '4': const IncidentType(
      id: '4',
      value1: 'RESCUE',
      description1: 'Rescue',
      value2: 'TRANSPORTATION',
      description2: 'Transportation (Land)',
      value3: 'MOTOR_VEHICLE_EXTRICATION_ENTRAPPED',
      description3: 'Motor Vehicle Collision Extrication / Entrapment',
    ),
    '5': const IncidentType(
      id: '5',
      value1: 'HAZSIT',
      description1: 'Hazardous Situation',
      value2: 'HAZARDOUS_MATERIALS',
      description2: 'Mazardous Materials',
      value3: 'GAS_LEAK_ODOR',
      description3: 'Gas Leak / Gas Odor',
    ),
    '6': const IncidentType(
      id: '6',
      value1: 'PUBSERV',
      description1: 'Public Service',
      value2: 'CITIZEN_ASSIST',
      description2: 'Citizen Assist',
      value3: 'LIFE_ASSIST',
      description3: 'Lift Assist',
    ),
    '7': const IncidentType(
      id: '7',
      value1: 'NOEMERG',
      description1: 'No Emergency',
      value2: 'FALSE_ALARM',
      description2: 'False Alarm',
      value3: 'ACCIDENTAL_ALARM',
      description3: 'Accidental Alarm',
    ),
  };

  Stream<List<IncidentType>> getIncidentTypes() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield _types.values.toList();
  }

  Stream<IncidentType?> getIncidentType(String id) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield _types[id];
  }

}