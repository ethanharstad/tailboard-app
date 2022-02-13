import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_access.freezed.dart';
part 'user_access.g.dart';

@freezed
class UserAccess with _$UserAccess {
  factory UserAccess({
    required String id,
    required String user,
    required String organization,
    required String access,
  }) = _UserAccess;

  factory UserAccess.fromJson(Map<String, dynamic> json) =>
      _$UserAccessFromJson(json);
}
