import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_type.freezed.dart';
part 'incident_type.g.dart';

@freezed
class IncidentType with _$IncidentType {
  const IncidentType._();

  const factory IncidentType({
    required String id,
    required String value1,
    required String description1,
    required String value2,
    required String description2,
    required String value3,
    required String description3,
  }) = _IncidentType;

  factory IncidentType.fromJson(Map<String, dynamic> json) => _$IncidentTypeFromJson(json);
}