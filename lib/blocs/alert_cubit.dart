import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tailboard_app/models/alert.dart';
import 'package:tailboard_app/repositories/alert_repository.dart';

part 'alert_cubit.freezed.dart';

part 'alert_cubit_state.dart';

class AlertCubit extends Cubit<AlertCubitState> {
  final AlertRepository _alertRepository;
  late Stream<List<Alert>> _stream;

  AlertCubit() : _alertRepository = AlertRepository(), super(const AlertCubitState.loading()) {
    _stream = _alertRepository.getAlerts();
    _stream.listen(data);
  }

  void data(List<Alert> alerts) {
    int unread = 0;
    for (Alert alert in alerts) {
      if (alert.unread) {
        unread++;
      }
    }
    emit(AlertCubitState.data(alerts: alerts, unread: unread));
  }

  void alertRead(Alert alert) {
    if (state is! Data) {
      throw const FormatException(
          "Cannot mark an alert as read when state is not ready.");
    }
    if (alert.unread == false) {
      return;
    }
    for (int i = 0; i < (state as Data).alerts.length; i++) {
      Alert e = (state as Data).alerts[i];
      if (e == alert) {
        List<Alert> newAlerts = List.from((state as Data).alerts);
        newAlerts[i] = e.copyWith(unread: false);
        emit(AlertCubitState.data(
          alerts: newAlerts,
          unread: ((state as Data).unread - 1),
        ));
      }
    }
  }

  void alertDismissed(Alert alert) {
    if (state is! Data) {
      throw const FormatException(
          "Cannot mark an alert as dismissed when state is not ready.");
    }
    if (alert.dismissed != null) {
      return;
    }
    for (int i = 0; i < (state as Data).alerts.length; i++) {
      Alert e = (state as Data).alerts[i];
      if (e == alert) {
        List<Alert> newAlerts = List.from((state as Data).alerts);
        newAlerts[i] = e.copyWith(unread: false, dismissed: DateTime.now());
        emit(AlertCubitState.data(
          alerts: newAlerts,
          unread: e.unread ? (state as Data).unread - 1: (state as Data).unread,
        ));
      }
    }
  }
}
