import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tailboard_app/models/neris/location.dart';

part 'incident.freezed.dart';
part 'incident.g.dart';

@freezed
class Incident with _$Incident {
  const Incident._();

  const factory Incident({
    required String id,
    required String incidentNumber,
    required Location location,
    required DateTime timestamp,
  }) = _Incident;

  factory Incident.fromJson(Map<String, dynamic> json) => _$IncidentFromJson(json);
}