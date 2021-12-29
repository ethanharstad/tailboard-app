// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'algorithm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlgorithmTearOff {
  const _$AlgorithmTearOff();

  _Algorithm call(
      {required String id,
      required String name,
      required String start,
      String? document,
      dynamic steps = const []}) {
    return _Algorithm(
      id: id,
      name: name,
      start: start,
      document: document,
      steps: steps,
    );
  }
}

/// @nodoc
const $Algorithm = _$AlgorithmTearOff();

/// @nodoc
mixin _$Algorithm {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get start => throw _privateConstructorUsedError;
  String? get document => throw _privateConstructorUsedError;
  dynamic get steps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlgorithmCopyWith<Algorithm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlgorithmCopyWith<$Res> {
  factory $AlgorithmCopyWith(Algorithm value, $Res Function(Algorithm) then) =
      _$AlgorithmCopyWithImpl<$Res>;
  $Res call(
      {String id, String name, String start, String? document, dynamic steps});
}

/// @nodoc
class _$AlgorithmCopyWithImpl<$Res> implements $AlgorithmCopyWith<$Res> {
  _$AlgorithmCopyWithImpl(this._value, this._then);

  final Algorithm _value;
  // ignore: unused_field
  final $Res Function(Algorithm) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? start = freezed,
    Object? document = freezed,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      document: document == freezed
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$AlgorithmCopyWith<$Res> implements $AlgorithmCopyWith<$Res> {
  factory _$AlgorithmCopyWith(
          _Algorithm value, $Res Function(_Algorithm) then) =
      __$AlgorithmCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String name, String start, String? document, dynamic steps});
}

/// @nodoc
class __$AlgorithmCopyWithImpl<$Res> extends _$AlgorithmCopyWithImpl<$Res>
    implements _$AlgorithmCopyWith<$Res> {
  __$AlgorithmCopyWithImpl(_Algorithm _value, $Res Function(_Algorithm) _then)
      : super(_value, (v) => _then(v as _Algorithm));

  @override
  _Algorithm get _value => super._value as _Algorithm;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? start = freezed,
    Object? document = freezed,
    Object? steps = freezed,
  }) {
    return _then(_Algorithm(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      document: document == freezed
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: steps == freezed ? _value.steps : steps,
    ));
  }
}

/// @nodoc

class _$_Algorithm with DiagnosticableTreeMixin implements _Algorithm {
  _$_Algorithm(
      {required this.id,
      required this.name,
      required this.start,
      this.document,
      this.steps = const []});

  @override
  final String id;
  @override
  final String name;
  @override
  final String start;
  @override
  final String? document;
  @JsonKey()
  @override
  final dynamic steps;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Algorithm(id: $id, name: $name, start: $start, document: $document, steps: $steps)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Algorithm'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('document', document))
      ..add(DiagnosticsProperty('steps', steps));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Algorithm &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.document, document) &&
            const DeepCollectionEquality().equals(other.steps, steps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(document),
      const DeepCollectionEquality().hash(steps));

  @JsonKey(ignore: true)
  @override
  _$AlgorithmCopyWith<_Algorithm> get copyWith =>
      __$AlgorithmCopyWithImpl<_Algorithm>(this, _$identity);
}

abstract class _Algorithm implements Algorithm {
  factory _Algorithm(
      {required String id,
      required String name,
      required String start,
      String? document,
      dynamic steps}) = _$_Algorithm;

  @override
  String get id;
  @override
  String get name;
  @override
  String get start;
  @override
  String? get document;
  @override
  dynamic get steps;
  @override
  @JsonKey(ignore: true)
  _$AlgorithmCopyWith<_Algorithm> get copyWith =>
      throw _privateConstructorUsedError;
}
