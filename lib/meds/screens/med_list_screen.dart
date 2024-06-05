import 'package:flutter/material.dart';
import 'package:tailboard_app/meds/data/local_medication_repository.dart';
import 'package:tailboard_app/meds/data/medication_repository.dart';
import 'package:tailboard_app/meds/models/medication.dart';
import 'package:tailboard_app/meds/screens/med_detail_screen.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class MedListScreen extends StatefulWidget {
  const MedListScreen({super.key});

  @override
  State<MedListScreen> createState() => _MedListScreenState();
}

class _MedListScreenState extends State<MedListScreen> {
  final MedicationRepository repository = LocalMedicationRepository();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Med List",
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: SearchBar(
              leading: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Medication>>(
              stream: repository.getMedications(),
              builder: (BuildContext context, AsyncSnapshot<List<Medication>> snapshot) {
                return ListView(
                  padding: const EdgeInsets.all(4),
                  children: <Widget>[
                    for (Medication med in snapshot.data ?? [])
                      ListTile(
                        title: Text(med.name),
                        subtitle: Text(med.shortDescription),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) => MedDetailScreen(medication: med)),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
