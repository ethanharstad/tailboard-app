import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tailboard_app/models/neris/station.dart';

class StationRepository {
  static final StationRepository _repository = StationRepository._internal();

  StationRepository._internal();

  factory StationRepository() {
    return _repository;
  }

  Station _fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var json = snapshot.data()!;
    json['id'] = snapshot.id;
    return Station.fromJson(json);
  }

  Map<String, Object?> _toFirestore(Station station, SetOptions? options) {
    var json = station.toJson();
    json.remove('id');
    return json;
  }

  Stream<List<Station>> getStations(String departmentId) async* {
    CollectionReference<Station> collectionReference = FirebaseFirestore
        .instance
        .collection('organizations')
        .doc(departmentId)
        .collection('stations')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        );
    print("/organizations/qCaIqv2FKIrryf3tKPBT/stations");
    print(collectionReference.path);
    await for (final querySnapshot in collectionReference.snapshots()) {
      print(querySnapshot.size);
      yield querySnapshot.docs
          .map((docSnapshot) => docSnapshot.data())
          .toList();
    }
  }

  Stream<Station?> getStation(String departmentId, String stationId) async* {
    CollectionReference<Station> collectionReference = FirebaseFirestore
        .instance
        .collection('organizations')
        .doc(departmentId)
        .collection('stations')
        .withConverter(
      fromFirestore: _fromFirestore,
      toFirestore: _toFirestore,
    );
    await for (final documentSnapshot in collectionReference.doc(stationId).snapshots()) {
      yield documentSnapshot.data();
    }
  }
}
