import 'package:tailboard_app/models/neris/incident.dart';

import '../models/neris/location.dart';

class IncidentRepository {
  static final IncidentRepository _repository = IncidentRepository._internal();

  IncidentRepository._internal();

  factory IncidentRepository() {
    return _repository;
  }

  final List<Incident> MOCK_INCIDENTS = [
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
        id: '2',
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
      id: "3",
      incidentNumber: '12346',
      location: const Location(
        id: '3',
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
    Incident(
      id: "4",
      incidentNumber: '12346',
      location: const Location(
        id: '4',
        anNumber: 1234,
        snPreModifier: 'W',
        snStreetName: '10th',
        snPostType: 'St',
        incorporatedMunicipality: 'Boone',
        state: 'IA',
        postalCode: '50036',
        county: 'Boone',
        country: 'USA',
      ),
      timestamp: DateTime.now().subtract(const Duration(hours: 31)),
    ),
    Incident(
      id: "5",
      incidentNumber: '12346',
      location: const Location(
        id: '5',
        anNumber: 705,
        anSuffix: "1/2",
        snStreetName: 'Story',
        snPostType: 'St',
        incorporatedMunicipality: 'Boone',
        state: 'IA',
        postalCode: '50036',
        county: 'Boone',
        country: 'USA',
      ),
      timestamp: DateTime.now().subtract(const Duration(hours: 31, minutes: 13)),
    ),
    Incident(
      id: "6",
      incidentNumber: '12346',
      location: const Location(
        id: '6',
        anNumber: 1426,
        snStreetName: '230th',
        snPostType: 'St',
        incorporatedMunicipality: 'Boone',
        state: 'IA',
        postalCode: '50036',
        county: 'Boone',
        country: 'USA',
      ),
      timestamp: DateTime.now().subtract(const Duration(hours: 33)),
    ),
  ];

  Stream<List<Incident>> getIncidents() async* {
    yield MOCK_INCIDENTS;
  }
}