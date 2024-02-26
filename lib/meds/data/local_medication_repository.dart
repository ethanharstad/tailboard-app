import 'package:tailboard_app/meds/data/medication_repository.dart';
import 'package:tailboard_app/meds/models/medication.dart';

final List<Medication> meds = [
  Medication(id: "1", name: "Ketamine", shortDescription: "Nonbarbituate anesthetic",),
  Medication(id: "2", name: "Albuterol", shortDescription: "Bronchodilator",),
];

class LocalMedicationRepository implements MedicationRepository {
  @override
  Stream<List<Medication>> getMedications() {
    return Stream.value(meds);
  }
}