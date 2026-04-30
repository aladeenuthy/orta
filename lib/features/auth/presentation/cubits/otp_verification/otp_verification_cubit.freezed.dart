// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtpVerificationState {
  ViewState get viewState => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;
  int get secondsRemaining => throw _privateConstructorUsedError;
  bool get canResend => throw _privateConstructorUsedError;
  bool get otpResent => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpVerificationStateCopyWith<OtpVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationStateCopyWith<$Res> {
  factory $OtpVerificationStateCopyWith(
    OtpVerificationState value,
    $Res Function(OtpVerificationState) then,
  ) = _$OtpVerificationStateCopyWithImpl<$Res, OtpVerificationState>;
  @useResult
  $Res call({
    ViewState viewState,
    String otp,
    int secondsRemaining,
    bool canResend,
    bool otpResent,
    String? errorMessage,
  });
}

/// @nodoc
class _$OtpVerificationStateCopyWithImpl<
  $Res,
  $Val extends OtpVerificationState
>
    implements $OtpVerificationStateCopyWith<$Res> {
  _$OtpVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? otp = null,
    Object? secondsRemaining = null,
    Object? canResend = null,
    Object? otpResent = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            otp: null == otp
                ? _value.otp
                : otp // ignore: cast_nullable_to_non_nullable
                      as String,
            secondsRemaining: null == secondsRemaining
                ? _value.secondsRemaining
                : secondsRemaining // ignore: cast_nullable_to_non_nullable
                      as int,
            canResend: null == canResend
                ? _value.canResend
                : canResend // ignore: cast_nullable_to_non_nullable
                      as bool,
            otpResent: null == otpResent
                ? _value.otpResent
                : otpResent // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtpVerificationStateImplCopyWith<$Res>
    implements $OtpVerificationStateCopyWith<$Res> {
  factory _$$OtpVerificationStateImplCopyWith(
    _$OtpVerificationStateImpl value,
    $Res Function(_$OtpVerificationStateImpl) then,
  ) = __$$OtpVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ViewState viewState,
    String otp,
    int secondsRemaining,
    bool canResend,
    bool otpResent,
    String? errorMessage,
  });
}

/// @nodoc
class __$$OtpVerificationStateImplCopyWithImpl<$Res>
    extends _$OtpVerificationStateCopyWithImpl<$Res, _$OtpVerificationStateImpl>
    implements _$$OtpVerificationStateImplCopyWith<$Res> {
  __$$OtpVerificationStateImplCopyWithImpl(
    _$OtpVerificationStateImpl _value,
    $Res Function(_$OtpVerificationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? otp = null,
    Object? secondsRemaining = null,
    Object? canResend = null,
    Object? otpResent = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$OtpVerificationStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        otp: null == otp
            ? _value.otp
            : otp // ignore: cast_nullable_to_non_nullable
                  as String,
        secondsRemaining: null == secondsRemaining
            ? _value.secondsRemaining
            : secondsRemaining // ignore: cast_nullable_to_non_nullable
                  as int,
        canResend: null == canResend
            ? _value.canResend
            : canResend // ignore: cast_nullable_to_non_nullable
                  as bool,
        otpResent: null == otpResent
            ? _value.otpResent
            : otpResent // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OtpVerificationStateImpl extends _OtpVerificationState {
  const _$OtpVerificationStateImpl({
    this.viewState = ViewState.initial,
    this.otp = '',
    this.secondsRemaining = 30,
    this.canResend = false,
    this.otpResent = false,
    this.errorMessage,
  }) : super._();

  @override
  @JsonKey()
  final ViewState viewState;
  @override
  @JsonKey()
  final String otp;
  @override
  @JsonKey()
  final int secondsRemaining;
  @override
  @JsonKey()
  final bool canResend;
  @override
  @JsonKey()
  final bool otpResent;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'OtpVerificationState(viewState: $viewState, otp: $otp, secondsRemaining: $secondsRemaining, canResend: $canResend, otpResent: $otpResent, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.secondsRemaining, secondsRemaining) ||
                other.secondsRemaining == secondsRemaining) &&
            (identical(other.canResend, canResend) ||
                other.canResend == canResend) &&
            (identical(other.otpResent, otpResent) ||
                other.otpResent == otpResent) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    viewState,
    otp,
    secondsRemaining,
    canResend,
    otpResent,
    errorMessage,
  );

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationStateImplCopyWith<_$OtpVerificationStateImpl>
  get copyWith =>
      __$$OtpVerificationStateImplCopyWithImpl<_$OtpVerificationStateImpl>(
        this,
        _$identity,
      );
}

abstract class _OtpVerificationState extends OtpVerificationState {
  const factory _OtpVerificationState({
    final ViewState viewState,
    final String otp,
    final int secondsRemaining,
    final bool canResend,
    final bool otpResent,
    final String? errorMessage,
  }) = _$OtpVerificationStateImpl;
  const _OtpVerificationState._() : super._();

  @override
  ViewState get viewState;
  @override
  String get otp;
  @override
  int get secondsRemaining;
  @override
  bool get canResend;
  @override
  bool get otpResent;
  @override
  String? get errorMessage;

  /// Create a copy of OtpVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationStateImplCopyWith<_$OtpVerificationStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
