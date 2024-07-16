import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/personnel/data/personnel_repository.dart';
import 'package:tailboard_app/personnel/models/personnel.dart';

class PersonnelList extends StatefulWidget {
  final String departmentId;
  final Function(String)? onTap;

  const PersonnelList({required this.departmentId, this.onTap, super.key});

  @override
  State<PersonnelList> createState() => _PersonnelListState();
}

class _PersonnelListState extends State<PersonnelList> {
  final PersonnelRepository personnelRepository = PersonnelRepository();
  late Stream<List<Personnel>> _personnelStream;

  @override
  void initState() {
    super.initState();
    _personnelStream =
        personnelRepository.getDepartmentPersonnel(widget.departmentId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _personnelStream,
      builder: (BuildContext context, AsyncSnapshot<List<Personnel>> snapshot) {
        if(snapshot.hasData) {
          if(snapshot.data?.isNotEmpty ?? false) {
            return ListView(
              children: [
                for (Personnel p in snapshot.data!)
                  ListTile(
                    title: Text("${p.firstName} ${p.lastName}"),
                    onTap: () {
                      context.goNamed(
                        'personnel_detail',
                        pathParameters: {
                          'departmentId': widget.departmentId,
                          'personnelId': p.id,
                        },
                      );
                    },
                  ),
              ],
            );
          }
          return const Text("No staff found");
        }
        return const Text('Loading...');
      },
    );
  }
}
