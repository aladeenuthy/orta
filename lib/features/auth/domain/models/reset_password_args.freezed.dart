// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_args.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResetPasswordArgs {
  String get userId => throw _privateConstructorUsedError;
  String get resetToken => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordArgsCopyWith<ResetPasswordArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordArgsCopyWith<$Res> {
  factory $ResetPasswordArgsCopyWith(
    ResetPasswordArgs value,
    $Res Function(ResetPasswordArgs) then,
  ) = _$ResetPasswordArgsCopyWithImpl<$Res, ResetPasswordArgs>;
  @useResult
  $Res call({String userId, String resetToken});
}

/// @nodoc
class _$ResetPasswordArgsCopyWithImpl<$Res, $Val extends ResetPasswordArgs>
    implements $ResetPasswordArgsCopyWith<$Res> {
  _$ResetPasswordArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? resetToken = null}) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            resetToken: null == resetToken
                ? _value.resetToken
                : resetToken // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResetPasswordArgsImplCopyWith<$Res>
    implements $ResetPasswordArgsCopyWith<$Res> {
  factory _$$ResetPasswordArgsImplCopyWith(
    _$ResetPasswordArgsImpl value,
    $Res Function(_$ResetPasswordArgsImpl) then,
  ) = __$$ResetPasswordArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String resetToken});
}

/// @nodoc
class __$$ResetPasswordArgsImplCopyWithImpl<$Res>
    extends _$ResetPasswordArgsCopyWithImpl<$Res, _$ResetPasswordArgsImpl>
    implements _$$ResetPasswordArgsImplCopyWith<$Res> {
  __$$ResetPasswordArgsImplCopyWithImpl(
    _$ResetPasswordArgsImpl _value,
    $Res Function(_$ResetPasswordArgsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPasswordArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? resetToken = null}) {
    return _then(
      _$ResetPasswordArgsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        resetToken: null == resetToken
            ? _value.resetToken
            : resetToken // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResetPasswordArgsImpl implements _ResetPasswordArgs {
  const _$ResetPasswordArgsImpl({
    required this.userId,
    required this.resetToken,
  });

  @override
  final String userId;
  @override
  final String resetToken;

  @override
  String toString() {
    return 'ResetPasswordArgs(userId: $userId, resetToken: $resetToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordArgsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.resetToken, resetToken) ||
                other.resetToken == resetToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, resetToken);

  /// Create a copy of ResetPasswordArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordArgsImplCopyWith<_$ResetPasswordArgsImpl> get copyWith =>
      __$$ResetPasswordArgsImplCopyWithImpl<_$ResetPasswordArgsImpl>(
        this,
        _$identity,
      );
}

abstract class _ResetPasswordArgs implements ResetPasswordArgs {
  const factory _ResetPasswordArgs({
    required final String userId,
    required final String resetToken,
  }) = _$ResetPasswordArgsImpl;

  @override
  String get userId;
  @override
  String get resetToken;

  /// Create a copy of ResetPasswordArgs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordArgsImplCopyWith<_$ResetPasswordArgsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
