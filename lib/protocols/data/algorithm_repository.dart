import 'package:tailboard_app/protocols/models/algorithm.dart';

abstract class AlgorithmRepository {
  Future<Algorithm> createAlgorithm(Algorithm algorithm);
  Stream<List<Algorithm>> getAlgorithms();
  Future<Algorithm> updateAlgorithm(Algorithm algorithm);
  Future<bool> deleteAlgorithm(Algorithm algorithm);
}
