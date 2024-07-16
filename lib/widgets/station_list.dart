import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tailboard_app/models/neris/station.dart';
import 'package:tailboard_app/repositories/station_repository.dart';

class StationList extends StatefulWidget {
  final String departmentId;

  const StationList({required this.departmentId, super.key});

  @override
  State<StationList> createState() => _StationListState();
}

class _StationListState extends State<StationList> {
  final StationRepository stationRepository = StationRepository();
  late Stream<List<Station>> _stationsStream;

  @override
  void initState() {
    super.initState();
    _stationsStream = stationRepository.getStations(widget.departmentId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
}