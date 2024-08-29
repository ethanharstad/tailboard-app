import 'package:flutter/material.dart';
import 'package:tailboard_app/models/neris/department.dart';
import 'package:tailboard_app/models/neris/station.dart';
import 'package:tailboard_app/repositories/department_repository.dart';
import 'package:tailboard_app/repositories/station_repository.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class StationDetailScreen extends StatelessWidget {
  final DepartmentRepository departmentRepository = DepartmentRepository();
  final StationRepository stationRepository = StationRepository();
  final String stationId;
  final String departmentId;

  StationDetailScreen({
    required this.departmentId,
    required this.stationId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Station',
      body: StreamBuilder(
        stream: stationRepository.getStation(departmentId, stationId),
        builder: (BuildContext context, AsyncSnapshot<Station?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              Station station = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  StreamBuilder(
                    stream: departmentRepository
                        .getDepartment(station.departmentId),
                    builder: (BuildContext context,
                        AsyncSnapshot<Department?> snapshot) {
                      return Text(snapshot.data?.name ?? '');
                    },
                  ),
                ],
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
