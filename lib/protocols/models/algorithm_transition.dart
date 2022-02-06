import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'algorithm_transition.freezed.dart';
part 'algorithm_transition.g.dart';

@freezed
class AlgorithmTransition with _$AlgorithmTransition {
  factory AlgorithmTransition({
    required String id,
    required String to,
    String? body,
    @Default(0) int weight,
  }) = _AlgorithmTransition;

  factory AlgorithmTransition.fromJson(Map<String, dynamic> json) => _$AlgorithmTransitionFromJson(json);
}
