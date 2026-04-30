// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_verification_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LocationVerificationResult _$LocationVerificationResultFromJson(
  Map<String, dynamic> json,
) {
  return _LocationVerificationResult.fromJson(json);
}

/// @nodoc
mixin _$LocationVerificationResult {
  bool get withinRange => throw _privateConstructorUsedError;
  num get distanceMeters => throw _privateConstructorUsedError;
  num get radiusMeters => throw _privateConstructorUsedError;

  /// Serializes this LocationVerificationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationVerificationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationVerificationResultCopyWith<LocationVerificationResult>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationVerificationResultCopyWith<$Res> {
  factory $LocationVerificationResultCopyWith(
    LocationVerificationResult value,
    $Res Function(LocationVerificationResult) then,
  ) =
      _$LocationVerificationResultCopyWithImpl<
        $Res,
        LocationVerificationResult
      >;
  @useResult
  $Res call({bool withinRange, num distanceMeters, num radiusMeters});
}

/// @nodoc
class _$LocationVerificationResultCopyWithImpl<
  $Res,
  $Val extends LocationVerificationResult
>
    implements $LocationVerificationResultCopyWith<$Res> {
  _$LocationVerificationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationVerificationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withinRange = null,
    Object? distanceMeters = null,
    Object? radiusMeters = null,
  }) {
    return _then(
      _value.copyWith(
            withinRange: null == withinRange
                ? _value.withinRange
                : withinRange // ignore: cast_nullable_to_non_nullable
                      as bool,
            distanceMeters: null == distanceMeters
                ? _value.distanceMeters
                : distanceMeters // ignore: cast_nullable_to_non_nullable
                      as num,
            radiusMeters: null == radiusMeters
                ? _value.radiusMeters
                : radiusMeters // ignore: cast_nullable_to_non_nullable
                      as num,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationVerificationResultImplCopyWith<$Res>
    implements $LocationVerificationResultCopyWith<$Res> {
  factory _$$LocationVerificationResultImplCopyWith(
    _$LocationVerificationResultImpl value,
    $Res Function(_$LocationVerificationResultImpl) then,
  ) = __$$LocationVerificationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool withinRange, num distanceMeters, num radiusMeters});
}

/// @nodoc
class __$$LocationVerificationResultImplCopyWithImpl<$Res>
    extends
        _$LocationVerificationResultCopyWithImpl<
          $Res,
          _$LocationVerificationResultImpl
        >
    implements _$$LocationVerificationResultImplCopyWith<$Res> {
  __$$LocationVerificationResultImplCopyWithImpl(
    _$LocationVerificationResultImpl _value,
    $Res Function(_$LocationVerificationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationVerificationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withinRange = null,
    Object? distanceMeters = null,
    Object? radiusMeters = null,
  }) {
    return _then(
      _$LocationVerificationResultImpl(
        withinRange: null == withinRange
            ? _value.withinRange
            : withinRange // ignore: cast_nullable_to_non_nullable
                  as bool,
        distanceMeters: null == distanceMeters
            ? _value.distanceMeters
            : distanceMeters // ignore: cast_nullable_to_non_nullable
                  as num,
        radiusMeters: null == radiusMeters
            ? _value.radiusMeters
            : radiusMeters // ignore: cast_nullable_to_non_nullable
                  as num,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationVerificationResultImpl implements _LocationVerificationResult {
  const _$LocationVerificationResultImpl({
    required this.withinRange,
    required this.distanceMeters,
    required this.radiusMeters,
  });

  factory _$LocationVerificationResultImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$LocationVerificationResultImplFromJson(json);

  @override
  final bool withinRange;
  @override
  final num distanceMeters;
  @override
  final num radiusMeters;

  @override
  String toString() {
    return 'LocationVerificationResult(withinRange: $withinRange, distanceMeters: $distanceMeters, radiusMeters: $radiusMeters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationVerificationResultImpl &&
            (identical(other.withinRange, withinRange) ||
                other.withinRange == withinRange) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.radiusMeters, radiusMeters) ||
                other.radiusMeters == radiusMeters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, withinRange, distanceMeters, radiusMeters);

  /// Create a copy of LocationVerificationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationVerificationResultImplCopyWith<_$LocationVerificationResultImpl>
  get copyWith =>
      __$$LocationVerificationResultImplCopyWithImpl<
        _$LocationVerificationResultImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationVerificationResultImplToJson(this);
  }
}

abstract class _LocationVerificationResult
    implements LocationVerificationResult {
  const factory _LocationVerificationResult({
    required final bool withinRange,
    required final num distanceMeters,
    required final num radiusMeters,
  }) = _$LocationVerificationResultImpl;

  factory _LocationVerificationResult.fromJson(Map<String, dynamic> json) =
      _$LocationVerificationResultImpl.fromJson;

  @override
  bool get withinRange;
  @override
  num get distanceMeters;
  @override
  num get radiusMeters;

  /// Create a copy of LocationVerificationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationVerificationResultImplCopyWith<_$LocationVerificationResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}
