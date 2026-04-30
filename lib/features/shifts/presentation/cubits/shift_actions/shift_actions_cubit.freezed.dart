// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_actions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShiftActionsState {
  ViewState get viewState => throw _privateConstructorUsedError;
  ShiftAction? get action => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ShiftActionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftActionsStateCopyWith<ShiftActionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftActionsStateCopyWith<$Res> {
  factory $ShiftActionsStateCopyWith(
    ShiftActionsState value,
    $Res Function(ShiftActionsState) then,
  ) = _$ShiftActionsStateCopyWithImpl<$Res, ShiftActionsState>;
  @useResult
  $Res call({ViewState viewState, ShiftAction? action, String? errorMessage});
}

/// @nodoc
class _$ShiftActionsStateCopyWithImpl<$Res, $Val extends ShiftActionsState>
    implements $ShiftActionsStateCopyWith<$Res> {
  _$ShiftActionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftActionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? action = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            action: freezed == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as ShiftAction?,
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
abstract class _$$ShiftActionsStateImplCopyWith<$Res>
    implements $ShiftActionsStateCopyWith<$Res> {
  factory _$$ShiftActionsStateImplCopyWith(
    _$ShiftActionsStateImpl value,
    $Res Function(_$ShiftActionsStateImpl) then,
  ) = __$$ShiftActionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ViewState viewState, ShiftAction? action, String? errorMessage});
}

/// @nodoc
class __$$ShiftActionsStateImplCopyWithImpl<$Res>
    extends _$ShiftActionsStateCopyWithImpl<$Res, _$ShiftActionsStateImpl>
    implements _$$ShiftActionsStateImplCopyWith<$Res> {
  __$$ShiftActionsStateImplCopyWithImpl(
    _$ShiftActionsStateImpl _value,
    $Res Function(_$ShiftActionsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftActionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? action = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$ShiftActionsStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        action: freezed == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as ShiftAction?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ShiftActionsStateImpl extends _ShiftActionsState {
  const _$ShiftActionsStateImpl({
    this.viewState = ViewState.initial,
    this.action,
    this.errorMessage,
  }) : super._();

  @override
  @JsonKey()
  final ViewState viewState;
  @override
  final ShiftAction? action;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ShiftActionsState(viewState: $viewState, action: $action, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftActionsStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewState, action, errorMessage);

  /// Create a copy of ShiftActionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftActionsStateImplCopyWith<_$ShiftActionsStateImpl> get copyWith =>
      __$$ShiftActionsStateImplCopyWithImpl<_$ShiftActionsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ShiftActionsState extends ShiftActionsState {
  const factory _ShiftActionsState({
    final ViewState viewState,
    final ShiftAction? action,
    final String? errorMessage,
  }) = _$ShiftActionsStateImpl;
  const _ShiftActionsState._() : super._();

  @override
  ViewState get viewState;
  @override
  ShiftAction? get action;
  @override
  String? get errorMessage;

  /// Create a copy of ShiftActionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftActionsStateImplCopyWith<_$ShiftActionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
