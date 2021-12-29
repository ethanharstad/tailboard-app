// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'algorithm_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlgorithmStepTearOff {
  const _$AlgorithmStepTearOff();

  _AlgorithmStep call(
      {required String id,
      String? label,
      String? color,
      String? type,
      required String body,
      List<AlgorithmTransition> transitions = const []}) {
    return _AlgorithmStep(
      id: id,
      label: label,
      color: color,
      type: type,
      body: body,
      transitions: transitions,
    );
  }
}

/// @nodoc
const $AlgorithmStep = _$AlgorithmStepTearOff();

/// @nodoc
mixin _$AlgorithmStep {
  String get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  List<AlgorithmTransition> get transitions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlgorithmStepCopyWith<AlgorithmStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlgorithmStepCopyWith<$Res> {
  factory $AlgorithmStepCopyWith(
          AlgorithmStep value, $Res Function(AlgorithmStep) then) =
      _$AlgorithmStepCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? label,
      String? color,
      String? type,
      String body,
      List<AlgorithmTransition> transitions});
}

/// @nodoc
class _$AlgorithmStepCopyWithImpl<$Res>
    implements $AlgorithmStepCopyWith<$Res> {
  _$AlgorithmStepCopyWithImpl(this._value, this._then);

  final AlgorithmStep _value;
  // ignore: unused_field
  final $Res Function(AlgorithmStep) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? color = freezed,
    Object? type = freezed,
    Object? body = freezed,
    Object? transitions = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      transitions: transitions == freezed
          ? _value.transitions
          : transitions // ignore: cast_nullable_to_non_nullable
              as List<AlgorithmTransition>,
    ));
  }
}

/// @nodoc
abstract class _$AlgorithmStepCopyWith<$Res>
    implements $AlgorithmStepCopyWith<$Res> {
  factory _$AlgorithmStepCopyWith(
          _AlgorithmStep value, $Res Function(_AlgorithmStep) then) =
      __$AlgorithmStepCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? label,
      String? color,
      String? type,
      String body,
      List<AlgorithmTransition> transitions});
}

/// @nodoc
class __$AlgorithmStepCopyWithImpl<$Res>
    extends _$AlgorithmStepCopyWithImpl<$Res>
    implements _$AlgorithmStepCopyWith<$Res> {
  __$AlgorithmStepCopyWithImpl(
      _AlgorithmStep _value, $Res Function(_AlgorithmStep) _then)
      : super(_value, (v) => _then(v as _AlgorithmStep));

  @override
  _AlgorithmStep get _value => super._value as _AlgorithmStep;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
    Object? color = freezed,
    Object? type = freezed,
    Object? body = freezed,
    Object? transitions = freezed,
  }) {
    return _then(_AlgorithmStep(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      transitions: transitions == freezed
          ? _value.transitions
          : transitions // ignore: cast_nullable_to_non_nullable
              as List<AlgorithmTransition>,
    ));
  }
}

/// @nodoc

class _$_AlgorithmStep with DiagnosticableTreeMixin implements _AlgorithmStep {
  _$_AlgorithmStep(
      {required this.id,
      this.label,
      this.color,
      this.type,
      required this.body,
      this.transitions = const []});

  @override
  final String id;
  @override
  final String? label;
  @override
  final String? color;
  @override
  final String? type;
  @override
  final String body;
  @JsonKey()
  @override
  final List<AlgorithmTransition> transitions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlgorithmStep(id: $id, label: $label, color: $color, type: $type, body: $body, transitions: $transitions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlgorithmStep'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('transitions', transitions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AlgorithmStep &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality()
                .equals(other.transitions, transitions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(transitions));

  @JsonKey(ignore: true)
  @override
  _$AlgorithmStepCopyWith<_AlgorithmStep> get copyWith =>
      __$AlgorithmStepCopyWithImpl<_AlgorithmStep>(this, _$identity);
}

abstract class _AlgorithmStep implements AlgorithmStep {
  factory _AlgorithmStep(
      {required String id,
      String? label,
      String? color,
      String? type,
      required String body,
      List<AlgorithmTransition> transitions}) = _$_AlgorithmStep;

  @override
  String get id;
  @override
  String? get label;
  @override
  String? get color;
  @override
  String? get type;
  @override
  String get body;
  @override
  List<AlgorithmTransition> get transitions;
  @override
  @JsonKey(ignore: true)
  _$AlgorithmStepCopyWith<_AlgorithmStep> get copyWith =>
      throw _privateConstructorUsedError;
}
