import 'package:flutter/material.dart';
import 'package:tailboard_app/models/neris/department.dart';
import 'package:tailboard_app/personnel/data/personnel_repository.dart';
import 'package:tailboard_app/personnel/widgets/personnel_list.dart';
import 'package:tailboard_app/repositories/department_repository.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';
import 'package:tailboard_app/widgets/station_list.dart';

class DepartmentDetailScreen extends StatefulWidget {
  final String departmentId;

  const DepartmentDetailScreen({required this.departmentId, super.key});

  @override
  State<DepartmentDetailScreen> createState() => _DepartmentDetailScreenState();
}

class _DepartmentDetailScreenState extends State<DepartmentDetailScreen>
    with SingleTickerProviderStateMixin {
  final DepartmentRepository departmentRepository = DepartmentRepository();
  final PersonnelRepository personnelRepository = PersonnelRepository();
  late TabController _tabController;
  late Stream<Department?> _departmentStream;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _departmentStream = departmentRepository.getDepartment(widget.departmentId);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Department',
      body: StreamBuilder(
        stream: _departmentStream,
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
                        StationList(departmentId: widget.departmentId),
                        PersonnelList(departmentId: widget.departmentId),
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
