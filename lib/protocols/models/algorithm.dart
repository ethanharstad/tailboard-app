import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'algorithm.freezed.dart';

@freezed
class Algorithm with _$Algorithm {
  factory Algorithm({
    required String id,
    required String name,
    required String start,
    String? document,
    @Default([]) steps,
  }) = _Algorithm;
}
