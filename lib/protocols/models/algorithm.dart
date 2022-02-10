import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:tailboard_app/protocols/models/algorithm_step.dart';

import 'algorithm_note.dart';

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
    @JsonKey(fromJson: stepsFromJson) @Default({}) Map<String, AlgorithmStep> steps,
    @JsonKey(fromJson: notesFromJson) @Default({}) Map<String, AlgorithmNote> notes,
  }) = _Algorithm;

  factory Algorithm.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmFromJson(json);
}

Map<String, AlgorithmStep> stepsFromJson(Map<String, dynamic> json) {
  Map<String, AlgorithmStep> typed = {};

  for(var entry in json.entries) {
    var data = entry.value;
    data['id'] = entry.key;
    typed[entry.key] = AlgorithmStep.fromJson(data);
  }

  return typed;
}

Map<String, AlgorithmNote> notesFromJson(Map<String, dynamic> json) {
  Map<String, AlgorithmNote> typed = {};

  for(var entry in json.entries) {
    var data = entry.value;
    data['id'] = entry.key;
    typed[entry.key] = AlgorithmNote.fromJson(data);
  }

  return typed;
}
