import 'package:flutter/material.dart';
import 'package:tailboard_app/personnel/data/personnel_repository.dart';
import 'package:tailboard_app/personnel/models/personnel.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class PersonnelDetailScreen extends StatelessWidget {
  final PersonnelRepository personnelRepository = PersonnelRepository();
  final String personnelId;

  PersonnelDetailScreen({required this.personnelId, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Personnel Detail',
      body: StreamBuilder(
        stream: personnelRepository.getPersonnel(personnelId),
        builder: (BuildContext context, AsyncSnapshot<Personnel?> snapshot) {
          if(snapshot.hasData) {
            if(snapshot.data != null) {
              Personnel p = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${p.firstName} ${p.lastName}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              );
            }
            return const Center(child: Text('Personnel not found'),);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
