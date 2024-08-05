import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tailboard_app/models/alert.dart';

part 'alert_cubit.freezed.dart';

part 'alert_cubit_state.dart';

class AlertCubit extends Cubit<AlertCubitState> {
  AlertCubit() : super(const AlertCubitState.loading());

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

  }

  void alertDismissed(Alert alert) {

  }
}
