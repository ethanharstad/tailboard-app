import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tailboard_app/protocols/data/algorithm_repository.dart';
import 'package:tailboard_app/protocols/models/algorithm.dart';

class FirebaseAlgorithmRepository implements AlgorithmRepository {
  late CollectionReference<Algorithm> algorithmReference;
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  FirebaseAlgorithmRepository() {
    algorithmReference = FirebaseFirestore.instance
        .collection('algorithms')
        .withConverter<Algorithm>(
      fromFirestore: (snapshot, _) {
        var data = snapshot.data()!;
        data['id'] = snapshot.id;
        // debugPrint(encoder.convert(data));
        var algo = Algorithm.fromJson(data);
        debugPrint('algo');
        debugPrint(algo.toString());
        return algo;
      },
      toFirestore: (algorithm, _) {
        var data = algorithm.toJson();
        data.remove('id');
        return data;
      },
    );
  }

  @override
  Future<Algorithm> createAlgorithm(Algorithm algorithm) {
    // TODO: implement createAlgorithm
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteAlgorithm(Algorithm algorithm) {
    // TODO: implement deleteAlgorithm
    throw UnimplementedError();
  }

  @override
  Stream<List<Algorithm>> getAlgorithms() {
    return algorithmReference.snapshots().map<List<Algorithm>>((snapshot) {
      return snapshot.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Future<Algorithm> updateAlgorithm(Algorithm algorithm) {
    // TODO: implement updateAlgorithm
    throw UnimplementedError();
  }
}
