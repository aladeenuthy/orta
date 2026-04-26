// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetUserState {
  ViewState get viewState => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of GetUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetUserStateCopyWith<GetUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserStateCopyWith<$Res> {
  factory $GetUserStateCopyWith(
    GetUserState value,
    $Res Function(GetUserState) then,
  ) = _$GetUserStateCopyWithImpl<$Res, GetUserState>;
  @useResult
  $Res call({ViewState viewState, User? user, String? errorMessage});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$GetUserStateCopyWithImpl<$Res, $Val extends GetUserState>
    implements $GetUserStateCopyWith<$Res> {
  _$GetUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as User?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of GetUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUserStateImplCopyWith<$Res>
    implements $GetUserStateCopyWith<$Res> {
  factory _$$GetUserStateImplCopyWith(
    _$GetUserStateImpl value,
    $Res Function(_$GetUserStateImpl) then,
  ) = __$$GetUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ViewState viewState, User? user, String? errorMessage});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$GetUserStateImplCopyWithImpl<$Res>
    extends _$GetUserStateCopyWithImpl<$Res, _$GetUserStateImpl>
    implements _$$GetUserStateImplCopyWith<$Res> {
  __$$GetUserStateImplCopyWithImpl(
    _$GetUserStateImpl _value,
    $Res Function(_$GetUserStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$GetUserStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$GetUserStateImpl extends _GetUserState {
  const _$GetUserStateImpl({
    this.viewState = ViewState.initial,
    this.user,
    this.errorMessage,
  }) : super._();

  @override
  @JsonKey()
  final ViewState viewState;
  @override
  final User? user;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'GetUserState(viewState: $viewState, user: $user, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewState, user, errorMessage);

  /// Create a copy of GetUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserStateImplCopyWith<_$GetUserStateImpl> get copyWith =>
      __$$GetUserStateImplCopyWithImpl<_$GetUserStateImpl>(this, _$identity);
}

abstract class _GetUserState extends GetUserState {
  const factory _GetUserState({
    final ViewState viewState,
    final User? user,
    final String? errorMessage,
  }) = _$GetUserStateImpl;
  const _GetUserState._() : super._();

  @override
  ViewState get viewState;
  @override
  User? get user;
  @override
  String? get errorMessage;

  /// Create a copy of GetUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserStateImplCopyWith<_$GetUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
