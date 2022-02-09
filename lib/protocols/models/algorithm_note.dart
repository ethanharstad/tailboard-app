import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'algorithm_note.freezed.dart';
part 'algorithm_note.g.dart';

@freezed
class AlgorithmNote with _$AlgorithmNote implements Comparable<AlgorithmNote> {
  const AlgorithmNote._();
  factory AlgorithmNote({
    required String id,
    String? title,
    required String body,
    @Default(0) int weight,
}) = _AlgorithmNote;

  factory AlgorithmNote.fromJson(Map<String, dynamic> json) => _$AlgorithmNoteFromJson(json);

  @override
  int compareTo(AlgorithmNote other) {
    return weight.compareTo(other.weight);
  }
}