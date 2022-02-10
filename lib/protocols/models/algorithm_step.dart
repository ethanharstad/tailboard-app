import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'algorithm_transition.dart';

part 'algorithm_step.freezed.dart';
part 'algorithm_step.g.dart';

@freezed
class AlgorithmStep with _$AlgorithmStep {
  factory AlgorithmStep({
    required String id,
    String? label,
    String? color,
    String? type,
    required String body,
    @JsonKey(fromJson: transitionsFromJson) @Default({}) Map<String, AlgorithmTransition> transitions,
    @Default(false) bool advance,
    int? duration,
  }) = _AlgorithmStep;

  factory AlgorithmStep.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmStepFromJson(json);
}

Map<String, AlgorithmTransition> transitionsFromJson(Map<String, dynamic> json) {
  Map<String, AlgorithmTransition> typed = {};

  for(var entry in json.entries) {
    var data = entry.value;
    data['id'] = entry.key;
    typed[entry.key] = AlgorithmTransition.fromJson(data);
  }

  return typed;
}