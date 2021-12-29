import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'algorithm_transition.freezed.dart';

@freezed
class AlgorithmTransition with _$AlgorithmTransition {
  factory AlgorithmTransition({
    required String from,
    required String to,
    String? body,
  }) = _AlgorithmTransition;
}
