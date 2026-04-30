// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verification_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtpVerificationArgs {
  String get email => throw _privateConstructorUsedError;
  String? get successRoute => throw _privateConstructorUsedError;
  bool get preventBack => throw _privateConstructorUsedError;
  bool get autoSendOtp => throw _privateConstructorUsedError;

  /// Create a copy of OtpVerificationArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpVerificationArgsCopyWith<OtpVerificationArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationArgsCopyWith<$Res> {
  factory $OtpVerificationArgsCopyWith(
    OtpVerificationArgs value,
    $Res Function(OtpVerificationArgs) then,
  ) = _$OtpVerificationArgsCopyWithImpl<$Res, OtpVerificationArgs>;
  @useResult
  $Res call({
    String email,
    String? successRoute,
    bool preventBack,
    bool autoSendOtp,
  });
}

/// @nodoc
class _$OtpVerificationArgsCopyWithImpl<$Res, $Val extends OtpVerificationArgs>
    implements $OtpVerificationArgsCopyWith<$Res> {
  _$OtpVerificationArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpVerificationArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? successRoute = freezed,
    Object? preventBack = null,
    Object? autoSendOtp = null,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            successRoute: freezed == successRoute
                ? _value.successRoute
                : successRoute // ignore: cast_nullable_to_non_nullable
                      as String?,
            preventBack: null == preventBack
                ? _value.preventBack
                : preventBack // ignore: cast_nullable_to_non_nullable
                      as bool,
            autoSendOtp: null == autoSendOtp
                ? _value.autoSendOtp
                : autoSendOtp // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtpVerificationArgsImplCopyWith<$Res>
    implements $OtpVerificationArgsCopyWith<$Res> {
  factory _$$OtpVerificationArgsImplCopyWith(
    _$OtpVerificationArgsImpl value,
    $Res Function(_$OtpVerificationArgsImpl) then,
  ) = __$$OtpVerificationArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String? successRoute,
    bool preventBack,
    bool autoSendOtp,
  });
}

/// @nodoc
class __$$OtpVerificationArgsImplCopyWithImpl<$Res>
    extends _$OtpVerificationArgsCopyWithImpl<$Res, _$OtpVerificationArgsImpl>
    implements _$$OtpVerificationArgsImplCopyWith<$Res> {
  __$$OtpVerificationArgsImplCopyWithImpl(
    _$OtpVerificationArgsImpl _value,
    $Res Function(_$OtpVerificationArgsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpVerificationArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? successRoute = freezed,
    Object? preventBack = null,
    Object? autoSendOtp = null,
  }) {
    return _then(
      _$OtpVerificationArgsImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        successRoute: freezed == successRoute
            ? _value.successRoute
            : successRoute // ignore: cast_nullable_to_non_nullable
                  as String?,
        preventBack: null == preventBack
            ? _value.preventBack
            : preventBack // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoSendOtp: null == autoSendOtp
            ? _value.autoSendOtp
            : autoSendOtp // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$OtpVerificationArgsImpl implements _OtpVerificationArgs {
  const _$OtpVerificationArgsImpl({
    required this.email,
    this.successRoute,
    this.preventBack = false,
    this.autoSendOtp = false,
  });

  @override
  final String email;
  @override
  final String? successRoute;
  @override
  @JsonKey()
  final bool preventBack;
  @override
  @JsonKey()
  final bool autoSendOtp;

  @override
  String toString() {
    return 'OtpVerificationArgs(email: $email, successRoute: $successRoute, preventBack: $preventBack, autoSendOtp: $autoSendOtp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationArgsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.successRoute, successRoute) ||
                other.successRoute == successRoute) &&
            (identical(other.preventBack, preventBack) ||
                other.preventBack == preventBack) &&
            (identical(other.autoSendOtp, autoSendOtp) ||
                other.autoSendOtp == autoSendOtp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, successRoute, preventBack, autoSendOtp);

  /// Create a copy of OtpVerificationArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationArgsImplCopyWith<_$OtpVerificationArgsImpl> get copyWith =>
      __$$OtpVerificationArgsImplCopyWithImpl<_$OtpVerificationArgsImpl>(
        this,
        _$identity,
      );
}

abstract class _OtpVerificationArgs implements OtpVerificationArgs {
  const factory _OtpVerificationArgs({
    required final String email,
    final String? successRoute,
    final bool preventBack,
    final bool autoSendOtp,
  }) = _$OtpVerificationArgsImpl;

  @override
  String get email;
  @override
  String? get successRoute;
  @override
  bool get preventBack;
  @override
  bool get autoSendOtp;

  /// Create a copy of OtpVerificationArgs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationArgsImplCopyWith<_$OtpVerificationArgsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
