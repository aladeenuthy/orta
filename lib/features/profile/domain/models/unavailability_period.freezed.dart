// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unavailability_period.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UnavailabilityPeriod _$UnavailabilityPeriodFromJson(Map<String, dynamic> json) {
  return _UnavailabilityPeriod.fromJson(json);
}

/// @nodoc
mixin _$UnavailabilityPeriod {
  String get id => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this UnavailabilityPeriod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnavailabilityPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnavailabilityPeriodCopyWith<UnavailabilityPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnavailabilityPeriodCopyWith<$Res> {
  factory $UnavailabilityPeriodCopyWith(
    UnavailabilityPeriod value,
    $Res Function(UnavailabilityPeriod) then,
  ) = _$UnavailabilityPeriodCopyWithImpl<$Res, UnavailabilityPeriod>;
  @useResult
  $Res call({String id, DateTime startDate, DateTime endDate, String? reason});
}

/// @nodoc
class _$UnavailabilityPeriodCopyWithImpl<
  $Res,
  $Val extends UnavailabilityPeriod
>
    implements $UnavailabilityPeriodCopyWith<$Res> {
  _$UnavailabilityPeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnavailabilityPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UnavailabilityPeriodImplCopyWith<$Res>
    implements $UnavailabilityPeriodCopyWith<$Res> {
  factory _$$UnavailabilityPeriodImplCopyWith(
    _$UnavailabilityPeriodImpl value,
    $Res Function(_$UnavailabilityPeriodImpl) then,
  ) = __$$UnavailabilityPeriodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime startDate, DateTime endDate, String? reason});
}

/// @nodoc
class __$$UnavailabilityPeriodImplCopyWithImpl<$Res>
    extends _$UnavailabilityPeriodCopyWithImpl<$Res, _$UnavailabilityPeriodImpl>
    implements _$$UnavailabilityPeriodImplCopyWith<$Res> {
  __$$UnavailabilityPeriodImplCopyWithImpl(
    _$UnavailabilityPeriodImpl _value,
    $Res Function(_$UnavailabilityPeriodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UnavailabilityPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = freezed,
  }) {
    return _then(
      _$UnavailabilityPeriodImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UnavailabilityPeriodImpl implements _UnavailabilityPeriod {
  const _$UnavailabilityPeriodImpl({
    required this.id,
    required this.startDate,
    required this.endDate,
    this.reason,
  });

  factory _$UnavailabilityPeriodImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnavailabilityPeriodImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String? reason;

  @override
  String toString() {
    return 'UnavailabilityPeriod(id: $id, startDate: $startDate, endDate: $endDate, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnavailabilityPeriodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startDate, endDate, reason);

  /// Create a copy of UnavailabilityPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnavailabilityPeriodImplCopyWith<_$UnavailabilityPeriodImpl>
  get copyWith =>
      __$$UnavailabilityPeriodImplCopyWithImpl<_$UnavailabilityPeriodImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UnavailabilityPeriodImplToJson(this);
  }
}

abstract class _UnavailabilityPeriod implements UnavailabilityPeriod {
  const factory _UnavailabilityPeriod({
    required final String id,
    required final DateTime startDate,
    required final DateTime endDate,
    final String? reason,
  }) = _$UnavailabilityPeriodImpl;

  factory _UnavailabilityPeriod.fromJson(Map<String, dynamic> json) =
      _$UnavailabilityPeriodImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String? get reason;

  /// Create a copy of UnavailabilityPeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnavailabilityPeriodImplCopyWith<_$UnavailabilityPeriodImpl>
  get copyWith => throw _privateConstructorUsedError;
}
