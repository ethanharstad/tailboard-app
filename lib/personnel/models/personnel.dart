import 'package:freezed_annotation/freezed_annotation.dart';

part 'personnel.freezed.dart';
part 'personnel.g.dart';

@freezed
class Personnel with _$Personnel {
  const Personnel._();

  const factory Personnel({
    required String id,
    required String departmentId,
    required String firstName,
    required String lastName,
    required String rankId,
    required DateTime serviceStart,
    required DateTime rankStart,
  }) = _Personnel;

  factory Personnel.fromJson(Map<String, dynamic> json) => _$PersonnelFromJson(json);
}
