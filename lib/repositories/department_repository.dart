import 'package:tailboard_app/models/neris/department.dart';

class DepartmentRepository {
  static final DepartmentRepository _repository = DepartmentRepository._internal();

  DepartmentRepository._internal();

  factory DepartmentRepository() {
    return _repository;
  }

  final Map<String, Department> data = {
    '1': Department(
      id: '1',
      name: 'Boone Fire Department',
    ),
  };

  Stream<List<Department>> getDepartments(String organizationId) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield data.values.toList(growable: false);
  }

  Stream<Department?> getDepartment(String departmentId) async* {
    await Future.delayed(const Duration(seconds: 1));
    yield null;
    if(data.containsKey(departmentId)) {
      yield data[departmentId];
    }
  }
}