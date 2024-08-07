import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/models/neris/department.dart';
import 'package:tailboard_app/repositories/department_repository.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class DepartmentListScreen extends StatelessWidget {
  final DepartmentRepository departmentRepository = DepartmentRepository();

  DepartmentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Departments",
      body: StreamBuilder(
        // TODO retrieve current organization
        stream: departmentRepository.getDepartments("FAKE"),
        builder:
            (BuildContext context, AsyncSnapshot<List<Department>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data!.isNotEmpty) {
              return ListView(
                children: [
                  for (Department dept in snapshot.data!)
                    ListTile(
                      title: Text(dept.name),
                      onTap: () {
                        context.goNamed('department_detail', pathParameters: {
                          'departmentId': dept.id,
                        });
                      },
                    ),
                ],
              );
            }
            return const Center(child: Text('No Departments Found'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
