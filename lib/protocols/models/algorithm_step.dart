import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'algorithm_transition.dart';

part 'algorithm_step.freezed.dart';

@freezed
class AlgorithmStep with _$AlgorithmStep {
  factory AlgorithmStep({
    required String id,
    String? label,
    String? color,
    String? type,
    required String body,
    @Default([]) List<AlgorithmTransition> transitions,
  }) = _AlgorithmStep;
}
