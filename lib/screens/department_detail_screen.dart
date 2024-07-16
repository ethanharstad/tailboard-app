import 'package:flutter/material.dart';
import 'package:tailboard_app/models/neris/department.dart';
import 'package:tailboard_app/models/neris/station.dart';
import 'package:tailboard_app/repositories/department_repository.dart';
import 'package:tailboard_app/repositories/station_repository.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class DepartmentDetailScreen extends StatelessWidget {
  final DepartmentRepository departmentRepository = DepartmentRepository();
  final StationRepository stationRepository = StationRepository();
  final String departmentId;

  DepartmentDetailScreen({required this.departmentId, super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Department',
      body: StreamBuilder(
        stream: departmentRepository.getDepartment(departmentId),
        builder: (BuildContext context, AsyncSnapshot<Department?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              Department dept = snapshot.data!;
              return Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dept.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Stations",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  StreamBuilder(
                    stream: stationRepository.getStations(departmentId),
                    builder: (BuildContext context, AsyncSnapshot<List<Station>> snapshot) {
                      if(snapshot.hasData) {
                        if(snapshot.data?.isNotEmpty ?? false) {
                          return Expanded(
                            child: ListView(
                              children: [
                                for(Station s in snapshot.data!)
                                  ListTile(
                                    title: Text(s.name),
                                  ),
                              ],
                            ),
                          );
                        }
                        return const Text('No Stations Found');
                      }
                      return const Text('Loading...');
                    },
                  ),
                ],
              );
            }
            return const Center(child: Text('No Department Found'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
