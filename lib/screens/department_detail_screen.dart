import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/models/neris/department.dart';
import 'package:tailboard_app/models/neris/station.dart';
import 'package:tailboard_app/personnel/data/personnel_repository.dart';
import 'package:tailboard_app/repositories/department_repository.dart';
import 'package:tailboard_app/repositories/station_repository.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class DepartmentDetailScreen extends StatefulWidget {
  final String departmentId;

  DepartmentDetailScreen({required this.departmentId, super.key});

  @override
  State<DepartmentDetailScreen> createState() => _DepartmentDetailScreenState();
}

class _DepartmentDetailScreenState extends State<DepartmentDetailScreen>
    with SingleTickerProviderStateMixin {
  final DepartmentRepository departmentRepository = DepartmentRepository();
  final StationRepository stationRepository = StationRepository();
  final PersonnelRepository personnelRepository = PersonnelRepository();
  late TabController _tabController;
  late Stream<List<Station>> _stationsStream;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _stationsStream = stationRepository.getStations(widget.departmentId);
  }

  Widget stationsList(BuildContext context) {
    return StreamBuilder(
      key: ValueKey('Stations:${widget.departmentId}'),
      stream: _stationsStream,
      builder: (BuildContext context, AsyncSnapshot<List<Station>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.isNotEmpty ?? false) {
            return ListView(
              children: [
                for (Station s in snapshot.data!)
                  ListTile(
                    title: Text(s.name),
                    onTap: () {
                      context.goNamed('station_detail', pathParameters: {
                        'departmentId': widget.departmentId,
                        'stationId': s.id,
                      });
                    },
                  ),
              ],
            );
          }
          return const Text('No Stations Found');
        }
        return const Text('Loading...');
      },
    );
  }

  Widget personnelList(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Department',
      body: StreamBuilder(
        stream: departmentRepository.getDepartment(widget.departmentId),
        builder: (BuildContext context, AsyncSnapshot<Department?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              Department dept = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dept.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 50,
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Stations'),
                        Tab(text: 'Staff'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        stationsList(context),
                        personnelList(context),
                      ],
                    ),
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
