import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tailboard_app/personnel/data/personnel_repository.dart';
import 'package:tailboard_app/personnel/data/rank_repository.dart';
import 'package:tailboard_app/personnel/models/personnel.dart';
import 'package:tailboard_app/personnel/models/rank.dart';
import 'package:tailboard_app/widgets/app_scaffold.dart';

class PersonnelDetailScreen extends StatefulWidget {
  final String personnelId;

  const PersonnelDetailScreen({required this.personnelId, super.key});

  @override
  State<PersonnelDetailScreen> createState() => _PersonnelDetailScreenState();
}

class _PersonnelDetailScreenState extends State<PersonnelDetailScreen> {
  final PersonnelRepository personnelRepository = PersonnelRepository();
  final RankRepository rankRepository = RankRepository();
  late final Stream<Personnel?> _personnelStream;

  @override
  void initState() {
    super.initState();
    _personnelStream = personnelRepository.getPersonnel(widget.personnelId);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Personnel Detail',
      body: StreamBuilder(
        stream: _personnelStream,
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
                  StreamBuilder(
                    stream: rankRepository.getRank(p.rankId),
                    builder: (BuildContext context, AsyncSnapshot<Rank?> snapshot) {
                      if(snapshot.hasData && snapshot.data != null) {
                        return Text(snapshot.data!.name);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  Text("Service Start: ${DateFormat.yMd().format(p.serviceStart)}"),
                  Text("Rank Start: ${DateFormat.yMd().format(p.rankStart)}"),
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
