import 'package:tailboard_app/meds/models/medication.dart';

abstract class MedicationRepository {
  Stream<List<Medication>> getMedications();
}