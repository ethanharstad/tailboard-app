import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication_dosage.freezed.dart';
part 'medication_dosage.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.pascal)
sealed class MedicationDosage with _$MedicationDosage {
  const factory MedicationDosage.constant() = ConstantDosage;
  const factory MedicationDosage.byWeight() = WeightDosage;

  factory MedicationDosage.fromJson(Map<String, dynamic> json) => _$MedicationDosageFromJson(json);
}