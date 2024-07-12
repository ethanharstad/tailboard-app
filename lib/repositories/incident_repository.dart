import 'package:tailboard_app/models/neris/incident.dart';

import '../models/neris/location.dart';

class IncidentRepository {
  static final IncidentRepository _repository = IncidentRepository._internal();

  IncidentRepository._internal();

  factory IncidentRepository() {
    return _repository;
  }

  Stream<List<Incident>> getIncidents() async* {
    yield [
      Incident(
        id: "1",
        incidentNumber: '12345',
        location: const Location(
          id: '1',
          anNumber: 123,
          snStreetName: 'Main',
          snPostType: 'St',
          incorporatedMunicipality: 'Boone',
          state: 'IA',
          postalCode: '50036',
          county: 'Boone',
          country: 'USA',
        ),
        timestamp: DateTime.now(),
      ),
      Incident(
        id: "2",
        incidentNumber: '12346',
        location: const Location(
          id: '1',
          anNumber: 456,
          snStreetName: 'Foo',
          snPostType: 'Ln',
          incorporatedMunicipality: 'Boone',
          state: 'IA',
          postalCode: '50036',
          county: 'Boone',
          country: 'USA',
        ),
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Incident(
        id: "2",
        incidentNumber: '12346',
        location: const Location(
          id: '1',
          anNumber: 789,
          snStreetName: 'Bar',
          snPostType: 'Ave',
          incorporatedMunicipality: 'Boone',
          state: 'IA',
          postalCode: '50036',
          county: 'Boone',
          country: 'USA',
        ),
        timestamp: DateTime.now().subtract(const Duration(hours: 25)),
      ),
    ];
  }
}