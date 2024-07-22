import 'package:freezed_annotation/freezed_annotation.dart';

part 'rank.freezed.dart';
part 'rank.g.dart';

@freezed
class Rank with _$Rank implements Comparable<Rank> {
  const Rank._();

  const factory Rank({
    required String departmentId,
    required String id,
    required int rankOrder,
    required String name,
    String? abbreviation,
  }) = _Rank;

  factory Rank.fromJson(Map<String, dynamic> json) => _$RankFromJson(json);

  @override
  int compareTo(Rank other) {
    return rankOrder - other.rankOrder;
  }
}