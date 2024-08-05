part of 'alert_cubit.dart';

@freezed
sealed class AlertCubitState with _$AlertCubitState {
  const factory AlertCubitState.loading() = _Loading;
  const factory AlertCubitState.data({required List<Alert> alerts, @Default(0) int unread}) = _Next;
  const factory AlertCubitState.error({required String message}) = _Error;
}
