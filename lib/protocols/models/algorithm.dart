import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';

part 'algorithm.freezed.dart';
part 'algorithm.g.dart';

@freezed
class Algorithm with _$Algorithm {
  factory Algorithm({
    required String id,
    required String name,
    required String start,
    required Set<String> tags,
    String? document,
    @Default([]) List<AlgorithmStep> steps,
  }) = _Algorithm;

  factory Algorithm.fromJson(Map<String, dynamic> json) => _$AlgorithmFromJson(json);
}
