// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkerProfile _$WorkerProfileFromJson(Map<String, dynamic> json) {
  return _WorkerProfile.fromJson(json);
}

/// @nodoc
mixin _$WorkerProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get jobRole => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  bool get isProfileComplete => throw _privateConstructorUsedError;

  /// Serializes this WorkerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerProfileCopyWith<WorkerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerProfileCopyWith<$Res> {
  factory $WorkerProfileCopyWith(
    WorkerProfile value,
    $Res Function(WorkerProfile) then,
  ) = _$WorkerProfileCopyWithImpl<$Res, WorkerProfile>;
  @useResult
  $Res call({
    String id,
    String name,
    String email,
    String? phone,
    String? city,
    String? jobRole,
    List<String> skills,
    String? profilePictureUrl,
    bool isProfileComplete,
  });
}

/// @nodoc
class _$WorkerProfileCopyWithImpl<$Res, $Val extends WorkerProfile>
    implements $WorkerProfileCopyWith<$Res> {
  _$WorkerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? city = freezed,
    Object? jobRole = freezed,
    Object? skills = null,
    Object? profilePictureUrl = freezed,
    Object? isProfileComplete = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobRole: freezed == jobRole
                ? _value.jobRole
                : jobRole // ignore: cast_nullable_to_non_nullable
                      as String?,
            skills: null == skills
                ? _value.skills
                : skills // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            profilePictureUrl: freezed == profilePictureUrl
                ? _value.profilePictureUrl
                : profilePictureUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isProfileComplete: null == isProfileComplete
                ? _value.isProfileComplete
                : isProfileComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkerProfileImplCopyWith<$Res>
    implements $WorkerProfileCopyWith<$Res> {
  factory _$$WorkerProfileImplCopyWith(
    _$WorkerProfileImpl value,
    $Res Function(_$WorkerProfileImpl) then,
  ) = __$$WorkerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String email,
    String? phone,
    String? city,
    String? jobRole,
    List<String> skills,
    String? profilePictureUrl,
    bool isProfileComplete,
  });
}

/// @nodoc
class __$$WorkerProfileImplCopyWithImpl<$Res>
    extends _$WorkerProfileCopyWithImpl<$Res, _$WorkerProfileImpl>
    implements _$$WorkerProfileImplCopyWith<$Res> {
  __$$WorkerProfileImplCopyWithImpl(
    _$WorkerProfileImpl _value,
    $Res Function(_$WorkerProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? city = freezed,
    Object? jobRole = freezed,
    Object? skills = null,
    Object? profilePictureUrl = freezed,
    Object? isProfileComplete = null,
  }) {
    return _then(
      _$WorkerProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobRole: freezed == jobRole
            ? _value.jobRole
            : jobRole // ignore: cast_nullable_to_non_nullable
                  as String?,
        skills: null == skills
            ? _value._skills
            : skills // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        profilePictureUrl: freezed == profilePictureUrl
            ? _value.profilePictureUrl
            : profilePictureUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isProfileComplete: null == isProfileComplete
            ? _value.isProfileComplete
            : isProfileComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkerProfileImpl implements _WorkerProfile {
  const _$WorkerProfileImpl({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.city,
    this.jobRole,
    final List<String> skills = const <String>[],
    this.profilePictureUrl,
    this.isProfileComplete = false,
  }) : _skills = skills;

  factory _$WorkerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? city;
  @override
  final String? jobRole;
  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final String? profilePictureUrl;
  @override
  @JsonKey()
  final bool isProfileComplete;

  @override
  String toString() {
    return 'WorkerProfile(id: $id, name: $name, email: $email, phone: $phone, city: $city, jobRole: $jobRole, skills: $skills, profilePictureUrl: $profilePictureUrl, isProfileComplete: $isProfileComplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.jobRole, jobRole) || other.jobRole == jobRole) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.isProfileComplete, isProfileComplete) ||
                other.isProfileComplete == isProfileComplete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    email,
    phone,
    city,
    jobRole,
    const DeepCollectionEquality().hash(_skills),
    profilePictureUrl,
    isProfileComplete,
  );

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerProfileImplCopyWith<_$WorkerProfileImpl> get copyWith =>
      __$$WorkerProfileImplCopyWithImpl<_$WorkerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerProfileImplToJson(this);
  }
}

abstract class _WorkerProfile implements WorkerProfile {
  const factory _WorkerProfile({
    required final String id,
    required final String name,
    required final String email,
    final String? phone,
    final String? city,
    final String? jobRole,
    final List<String> skills,
    final String? profilePictureUrl,
    final bool isProfileComplete,
  }) = _$WorkerProfileImpl;

  factory _WorkerProfile.fromJson(Map<String, dynamic> json) =
      _$WorkerProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get city;
  @override
  String? get jobRole;
  @override
  List<String> get skills;
  @override
  String? get profilePictureUrl;
  @override
  bool get isProfileComplete;

  /// Create a copy of WorkerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerProfileImplCopyWith<_$WorkerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
