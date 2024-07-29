import 'package:tailboard_app/models/alert.dart';

class AlertRepository {
  static final AlertRepository _singleton = AlertRepository._internal();

  AlertRepository._internal();

  factory AlertRepository() => _singleton;

  Map<String, Alert> alerts = {
    '1': Alert(
      id: '1',
      created: DateTime.now().subtract(const Duration(hours: 24)),
      unread: false,
      dismissed: DateTime.now().subtract(const Duration(hours: 23)),
      title: 'Dismissed alert',
    ),
    '2': Alert(
      id: '2',
      created: DateTime.now().subtract(const Duration(hours: 6)),
      unread: false,
      title: 'This is an alert',
    ),
    '3': Alert(
      id: '3',
      created: DateTime.now().subtract(const Duration(minutes: 1)),
      unread: true,
      title: 'Longer alert',
      body: 'Foo bar baz',
    ),
  };

  Stream<List<Alert>> getAlerts() async* {
    yield alerts.values.toList(growable: false);
  }

  Stream<Alert?> getAlert(String id) async* {
    await Future.delayed(const Duration(seconds: 1));
    if (alerts.containsKey(id)) {
      yield alerts[id];
    }
  }

  Alert updateAlert(Alert newAlert) {
    alerts[newAlert.id] = newAlert;
    return newAlert;
  }
}
