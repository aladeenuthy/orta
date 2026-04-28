// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AvailabilityDay _$AvailabilityDayFromJson(Map<String, dynamic> json) {
  return _AvailabilityDay.fromJson(json);
}

/// @nodoc
mixin _$AvailabilityDay {
  String get day => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;

  /// Serializes this AvailabilityDay to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityDayCopyWith<AvailabilityDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityDayCopyWith<$Res> {
  factory $AvailabilityDayCopyWith(
    AvailabilityDay value,
    $Res Function(AvailabilityDay) then,
  ) = _$AvailabilityDayCopyWithImpl<$Res, AvailabilityDay>;
  @useResult
  $Res call({String day, bool isAvailable, String startTime, String endTime});
}

/// @nodoc
class _$AvailabilityDayCopyWithImpl<$Res, $Val extends AvailabilityDay>
    implements $AvailabilityDayCopyWith<$Res> {
  _$AvailabilityDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? isAvailable = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(
      _value.copyWith(
            day: null == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as String,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailabilityDayImplCopyWith<$Res>
    implements $AvailabilityDayCopyWith<$Res> {
  factory _$$AvailabilityDayImplCopyWith(
    _$AvailabilityDayImpl value,
    $Res Function(_$AvailabilityDayImpl) then,
  ) = __$$AvailabilityDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, bool isAvailable, String startTime, String endTime});
}

/// @nodoc
class __$$AvailabilityDayImplCopyWithImpl<$Res>
    extends _$AvailabilityDayCopyWithImpl<$Res, _$AvailabilityDayImpl>
    implements _$$AvailabilityDayImplCopyWith<$Res> {
  __$$AvailabilityDayImplCopyWithImpl(
    _$AvailabilityDayImpl _value,
    $Res Function(_$AvailabilityDayImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailabilityDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? isAvailable = null,
    Object? startTime = null,
    Object? endTime = null,
  }) {
    return _then(
      _$AvailabilityDayImpl(
        day: null == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as String,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailabilityDayImpl implements _AvailabilityDay {
  const _$AvailabilityDayImpl({
    required this.day,
    this.isAvailable = false,
    this.startTime = '08:00',
    this.endTime = '21:00',
  });

  factory _$AvailabilityDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailabilityDayImplFromJson(json);

  @override
  final String day;
  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final String startTime;
  @override
  @JsonKey()
  final String endTime;

  @override
  String toString() {
    return 'AvailabilityDay(day: $day, isAvailable: $isAvailable, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityDayImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, day, isAvailable, startTime, endTime);

  /// Create a copy of AvailabilityDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityDayImplCopyWith<_$AvailabilityDayImpl> get copyWith =>
      __$$AvailabilityDayImplCopyWithImpl<_$AvailabilityDayImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailabilityDayImplToJson(this);
  }
}

abstract class _AvailabilityDay implements AvailabilityDay {
  const factory _AvailabilityDay({
    required final String day,
    final bool isAvailable,
    final String startTime,
    final String endTime,
  }) = _$AvailabilityDayImpl;

  factory _AvailabilityDay.fromJson(Map<String, dynamic> json) =
      _$AvailabilityDayImpl.fromJson;

  @override
  String get day;
  @override
  bool get isAvailable;
  @override
  String get startTime;
  @override
  String get endTime;

  /// Create a copy of AvailabilityDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityDayImplCopyWith<_$AvailabilityDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
