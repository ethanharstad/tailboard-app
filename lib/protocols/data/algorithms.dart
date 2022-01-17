import 'package:tailboard_app/protocols/models/algorithm.dart';
import 'package:tailboard_app/protocols/data/acls.dart';
import 'package:tailboard_app/protocols/data/bls.dart';

final List<Algorithm> algorithms = [
  Algorithm.fromJson(aclsJson),
  Algorithm.fromJson(blsJson),
];