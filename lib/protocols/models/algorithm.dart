import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    @Default({}) Map<String, AlgorithmStep> steps,
    @Default({}) Map<String, AlgorithmNote> notes,
  }) = _Algorithm;

  factory Algorithm.fromJson(Map<String, dynamic> json) => _$AlgorithmFromJson(json);
  factory Algorithm.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    data['id'] = snapshot.id;
    return Algorithm.fromJson(data);
  }
}
