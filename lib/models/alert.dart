import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

@freezed
class Alert with _$Alert {
  factory Alert({
    required String id,
    required DateTime created,
    required String title,
    String? body,
    @Default(true) bool unread,
    DateTime? dismissed,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}