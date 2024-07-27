import 'package:tailboard_app/models/alert.dart';

class AlertRepository {
  static final AlertRepository _singleton = AlertRepository._internal();

  AlertRepository._internal();

  factory AlertRepository() => _singleton;

  List<Alert> alerts = [
    Alert(
      id: '1',
      created: DateTime.now().subtract(const Duration(hours: 24)),
      unread: false,
      dismissed: DateTime.now().subtract(const Duration(hours: 23)),
      title: 'Dismissed alert',
    ),
    Alert(
      id: '2',
      created: DateTime.now().subtract(const Duration(hours: 6)),
      unread: false,
      title: 'This is an alert',
    ),
    Alert(
      id: '2',
      created: DateTime.now().subtract(const Duration(minutes: 1)),
      unread: true,
      title: 'Longer alert',
      body: 'Foo bar baz',
    ),
  ];
}
