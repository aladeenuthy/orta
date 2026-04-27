// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Shift _$ShiftFromJson(Map<String, dynamic> json) {
  return _Shift.fromJson(json);
}

/// @nodoc
mixin _$Shift {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  List<String> get typeOfShift => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get finishTime => throw _privateConstructorUsedError;
  int get numOfShiftsPerDay => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  num? get pay => throw _privateConstructorUsedError;

  /// Serializes this Shift to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftCopyWith<Shift> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftCopyWith<$Res> {
  factory $ShiftCopyWith(Shift value, $Res Function(Shift) then) =
      _$ShiftCopyWithImpl<$Res, Shift>;
  @useResult
  $Res call({
    String? id,
    String title,
    String role,
    List<String> typeOfShift,
    String user,
    String startTime,
    String finishTime,
    int numOfShiftsPerDay,
    Location location,
    DateTime date,
    String? status,
    num? pay,
  });

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$ShiftCopyWithImpl<$Res, $Val extends Shift>
    implements $ShiftCopyWith<$Res> {
  _$ShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? role = null,
    Object? typeOfShift = null,
    Object? user = null,
    Object? startTime = null,
    Object? finishTime = null,
    Object? numOfShiftsPerDay = null,
    Object? location = null,
    Object? date = null,
    Object? status = freezed,
    Object? pay = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            typeOfShift: null == typeOfShift
                ? _value.typeOfShift
                : typeOfShift // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            finishTime: null == finishTime
                ? _value.finishTime
                : finishTime // ignore: cast_nullable_to_non_nullable
                      as String,
            numOfShiftsPerDay: null == numOfShiftsPerDay
                ? _value.numOfShiftsPerDay
                : numOfShiftsPerDay // ignore: cast_nullable_to_non_nullable
                      as int,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as Location,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            pay: freezed == pay
                ? _value.pay
                : pay // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShiftImplCopyWith<$Res> implements $ShiftCopyWith<$Res> {
  factory _$$ShiftImplCopyWith(
    _$ShiftImpl value,
    $Res Function(_$ShiftImpl) then,
  ) = __$$ShiftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String title,
    String role,
    List<String> typeOfShift,
    String user,
    String startTime,
    String finishTime,
    int numOfShiftsPerDay,
    Location location,
    DateTime date,
    String? status,
    num? pay,
  });

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$ShiftImplCopyWithImpl<$Res>
    extends _$ShiftCopyWithImpl<$Res, _$ShiftImpl>
    implements _$$ShiftImplCopyWith<$Res> {
  __$$ShiftImplCopyWithImpl(
    _$ShiftImpl _value,
    $Res Function(_$ShiftImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? role = null,
    Object? typeOfShift = null,
    Object? user = null,
    Object? startTime = null,
    Object? finishTime = null,
    Object? numOfShiftsPerDay = null,
    Object? location = null,
    Object? date = null,
    Object? status = freezed,
    Object? pay = freezed,
  }) {
    return _then(
      _$ShiftImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        typeOfShift: null == typeOfShift
            ? _value._typeOfShift
            : typeOfShift // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        finishTime: null == finishTime
            ? _value.finishTime
            : finishTime // ignore: cast_nullable_to_non_nullable
                  as String,
        numOfShiftsPerDay: null == numOfShiftsPerDay
            ? _value.numOfShiftsPerDay
            : numOfShiftsPerDay // ignore: cast_nullable_to_non_nullable
                  as int,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as Location,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        pay: freezed == pay
            ? _value.pay
            : pay // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShiftImpl implements _Shift {
  const _$ShiftImpl({
    this.id,
    required this.title,
    required this.role,
    required final List<String> typeOfShift,
    required this.user,
    required this.startTime,
    required this.finishTime,
    required this.numOfShiftsPerDay,
    required this.location,
    required this.date,
    this.status,
    this.pay,
  }) : _typeOfShift = typeOfShift;

  factory _$ShiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShiftImplFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final String role;
  final List<String> _typeOfShift;
  @override
  List<String> get typeOfShift {
    if (_typeOfShift is EqualUnmodifiableListView) return _typeOfShift;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typeOfShift);
  }

  @override
  final String user;
  @override
  final String startTime;
  @override
  final String finishTime;
  @override
  final int numOfShiftsPerDay;
  @override
  final Location location;
  @override
  final DateTime date;
  @override
  final String? status;
  @override
  final num? pay;

  @override
  String toString() {
    return 'Shift(id: $id, title: $title, role: $role, typeOfShift: $typeOfShift, user: $user, startTime: $startTime, finishTime: $finishTime, numOfShiftsPerDay: $numOfShiftsPerDay, location: $location, date: $date, status: $status, pay: $pay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(
              other._typeOfShift,
              _typeOfShift,
            ) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.finishTime, finishTime) ||
                other.finishTime == finishTime) &&
            (identical(other.numOfShiftsPerDay, numOfShiftsPerDay) ||
                other.numOfShiftsPerDay == numOfShiftsPerDay) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pay, pay) || other.pay == pay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    role,
    const DeepCollectionEquality().hash(_typeOfShift),
    user,
    startTime,
    finishTime,
    numOfShiftsPerDay,
    location,
    date,
    status,
    pay,
  );

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      __$$ShiftImplCopyWithImpl<_$ShiftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShiftImplToJson(this);
  }
}

abstract class _Shift implements Shift {
  const factory _Shift({
    final String? id,
    required final String title,
    required final String role,
    required final List<String> typeOfShift,
    required final String user,
    required final String startTime,
    required final String finishTime,
    required final int numOfShiftsPerDay,
    required final Location location,
    required final DateTime date,
    final String? status,
    final num? pay,
  }) = _$ShiftImpl;

  factory _Shift.fromJson(Map<String, dynamic> json) = _$ShiftImpl.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  String get role;
  @override
  List<String> get typeOfShift;
  @override
  String get user;
  @override
  String get startTime;
  @override
  String get finishTime;
  @override
  int get numOfShiftsPerDay;
  @override
  Location get location;
  @override
  DateTime get date;
  @override
  String? get status;
  @override
  num? get pay;

  /// Create a copy of Shift
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftImplCopyWith<_$ShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
