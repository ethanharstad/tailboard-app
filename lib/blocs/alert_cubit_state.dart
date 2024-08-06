part of 'alert_cubit.dart';

@freezed
sealed class AlertCubitState with _$AlertCubitState {
  const factory AlertCubitState.loading() = Loading;
  const factory AlertCubitState.data({required List<Alert> alerts, @Default(0) int unread}) = Data;
  const factory AlertCubitState.error({required String message}) = Error;
}
