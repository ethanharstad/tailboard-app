// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'algorithm_transition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlgorithmTransitionTearOff {
  const _$AlgorithmTransitionTearOff();

  _AlgorithmTransition call(
      {required String from, required String to, String? body}) {
    return _AlgorithmTransition(
      from: from,
      to: to,
      body: body,
    );
  }
}

/// @nodoc
const $AlgorithmTransition = _$AlgorithmTransitionTearOff();

/// @nodoc
mixin _$AlgorithmTransition {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlgorithmTransitionCopyWith<AlgorithmTransition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlgorithmTransitionCopyWith<$Res> {
  factory $AlgorithmTransitionCopyWith(
          AlgorithmTransition value, $Res Function(AlgorithmTransition) then) =
      _$AlgorithmTransitionCopyWithImpl<$Res>;
  $Res call({String from, String to, String? body});
}

/// @nodoc
class _$AlgorithmTransitionCopyWithImpl<$Res>
    implements $AlgorithmTransitionCopyWith<$Res> {
  _$AlgorithmTransitionCopyWithImpl(this._value, this._then);

  final AlgorithmTransition _value;
  // ignore: unused_field
  final $Res Function(AlgorithmTransition) _then;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AlgorithmTransitionCopyWith<$Res>
    implements $AlgorithmTransitionCopyWith<$Res> {
  factory _$AlgorithmTransitionCopyWith(_AlgorithmTransition value,
          $Res Function(_AlgorithmTransition) then) =
      __$AlgorithmTransitionCopyWithImpl<$Res>;
  @override
  $Res call({String from, String to, String? body});
}

/// @nodoc
class __$AlgorithmTransitionCopyWithImpl<$Res>
    extends _$AlgorithmTransitionCopyWithImpl<$Res>
    implements _$AlgorithmTransitionCopyWith<$Res> {
  __$AlgorithmTransitionCopyWithImpl(
      _AlgorithmTransition _value, $Res Function(_AlgorithmTransition) _then)
      : super(_value, (v) => _then(v as _AlgorithmTransition));

  @override
  _AlgorithmTransition get _value => super._value as _AlgorithmTransition;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? body = freezed,
  }) {
    return _then(_AlgorithmTransition(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AlgorithmTransition
    with DiagnosticableTreeMixin
    implements _AlgorithmTransition {
  _$_AlgorithmTransition({required this.from, required this.to, this.body});

  @override
  final String from;
  @override
  final String to;
  @override
  final String? body;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlgorithmTransition(from: $from, to: $to, body: $body)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlgorithmTransition'))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('body', body));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlgorithmTransition &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to),
      const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  _$AlgorithmTransitionCopyWith<_AlgorithmTransition> get copyWith =>
      __$AlgorithmTransitionCopyWithImpl<_AlgorithmTransition>(
          this, _$identity);
}

abstract class _AlgorithmTransition implements AlgorithmTransition {
  factory _AlgorithmTransition(
      {required String from,
      required String to,
      String? body}) = _$_AlgorithmTransition;

  @override
  String get from;
  @override
  String get to;
  @override
  String? get body;
  @override
  @JsonKey(ignore: true)
  _$AlgorithmTransitionCopyWith<_AlgorithmTransition> get copyWith =>
      throw _privateConstructorUsedError;
}
