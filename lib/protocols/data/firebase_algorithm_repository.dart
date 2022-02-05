import 'package:tailboard_app/protocols/data/algorithm_repository.dart';
import 'package:tailboard_app/protocols/models/algorithm.dart';

class FirebaseAlgorithmRepository implements AlgorithmRepository {
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
    // TODO: implement getAlgorithms
    throw UnimplementedError();
  }

  @override
  Future<Algorithm> updateAlgorithm(Algorithm algorithm) {
    // TODO: implement updateAlgorithm
    throw UnimplementedError();
  }
}