// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WorkerProfileState {
  ViewState get viewState => throw _privateConstructorUsedError;
  WorkerProfile? get profile => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of WorkerProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerProfileStateCopyWith<WorkerProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerProfileStateCopyWith<$Res> {
  factory $WorkerProfileStateCopyWith(
    WorkerProfileState value,
    $Res Function(WorkerProfileState) then,
  ) = _$WorkerProfileStateCopyWithImpl<$Res, WorkerProfileState>;
  @useResult
  $Res call({
    ViewState viewState,
    WorkerProfile? profile,
    String? errorMessage,
  });

  $WorkerProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$WorkerProfileStateCopyWithImpl<$Res, $Val extends WorkerProfileState>
    implements $WorkerProfileStateCopyWith<$Res> {
  _$WorkerProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkerProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? profile = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            profile: freezed == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as WorkerProfile?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkerProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkerProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $WorkerProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkerProfileStateImplCopyWith<$Res>
    implements $WorkerProfileStateCopyWith<$Res> {
  factory _$$WorkerProfileStateImplCopyWith(
    _$WorkerProfileStateImpl value,
    $Res Function(_$WorkerProfileStateImpl) then,
  ) = __$$WorkerProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ViewState viewState,
    WorkerProfile? profile,
    String? errorMessage,
  });

  @override
  $WorkerProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$WorkerProfileStateImplCopyWithImpl<$Res>
    extends _$WorkerProfileStateCopyWithImpl<$Res, _$WorkerProfileStateImpl>
    implements _$$WorkerProfileStateImplCopyWith<$Res> {
  __$$WorkerProfileStateImplCopyWithImpl(
    _$WorkerProfileStateImpl _value,
    $Res Function(_$WorkerProfileStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkerProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? profile = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$WorkerProfileStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        profile: freezed == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as WorkerProfile?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$WorkerProfileStateImpl extends _WorkerProfileState {
  const _$WorkerProfileStateImpl({
    this.viewState = ViewState.initial,
    this.profile,
    this.errorMessage,
  }) : super._();

  @override
  @JsonKey()
  final ViewState viewState;
  @override
  final WorkerProfile? profile;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'WorkerProfileState(viewState: $viewState, profile: $profile, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerProfileStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, viewState, profile, errorMessage);

  /// Create a copy of WorkerProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerProfileStateImplCopyWith<_$WorkerProfileStateImpl> get copyWith =>
      __$$WorkerProfileStateImplCopyWithImpl<_$WorkerProfileStateImpl>(
        this,
        _$identity,
      );
}

abstract class _WorkerProfileState extends WorkerProfileState {
  const factory _WorkerProfileState({
    final ViewState viewState,
    final WorkerProfile? profile,
    final String? errorMessage,
  }) = _$WorkerProfileStateImpl;
  const _WorkerProfileState._() : super._();

  @override
  ViewState get viewState;
  @override
  WorkerProfile? get profile;
  @override
  String? get errorMessage;

  /// Create a copy of WorkerProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerProfileStateImplCopyWith<_$WorkerProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
