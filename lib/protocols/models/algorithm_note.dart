import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'algorithm_note.freezed.dart';
part 'algorithm_note.g.dart';

@freezed
class AlgorithmNote with _$AlgorithmNote {
  factory AlgorithmNote({
    required String id,
    String? title,
    required String body,
    @Default(0) int weight,
}) = _AlgorithmNote;

  factory AlgorithmNote.fromJson(Map<String, dynamic> json) => _$AlgorithmNoteFromJson(json);
}