// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShiftDetailState {
  ViewState get viewState => throw _privateConstructorUsedError;
  Shift? get shift => throw _privateConstructorUsedError;
  ShiftDetailAction? get action => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ShiftDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftDetailStateCopyWith<ShiftDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftDetailStateCopyWith<$Res> {
  factory $ShiftDetailStateCopyWith(
    ShiftDetailState value,
    $Res Function(ShiftDetailState) then,
  ) = _$ShiftDetailStateCopyWithImpl<$Res, ShiftDetailState>;
  @useResult
  $Res call({
    ViewState viewState,
    Shift? shift,
    ShiftDetailAction? action,
    String? errorMessage,
  });

  $ShiftCopyWith<$Res>? get shift;
}

/// @nodoc
class _$ShiftDetailStateCopyWithImpl<$Res, $Val extends ShiftDetailState>
    implements $ShiftDetailStateCopyWith<$Res> {
  _$ShiftDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? shift = freezed,
    Object? action = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            shift: freezed == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                      as Shift?,
            action: freezed == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as ShiftDetailAction?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ShiftDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShiftCopyWith<$Res>? get shift {
    if (_value.shift == null) {
      return null;
    }

    return $ShiftCopyWith<$Res>(_value.shift!, (value) {
      return _then(_value.copyWith(shift: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShiftDetailStateImplCopyWith<$Res>
    implements $ShiftDetailStateCopyWith<$Res> {
  factory _$$ShiftDetailStateImplCopyWith(
    _$ShiftDetailStateImpl value,
    $Res Function(_$ShiftDetailStateImpl) then,
  ) = __$$ShiftDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ViewState viewState,
    Shift? shift,
    ShiftDetailAction? action,
    String? errorMessage,
  });

  @override
  $ShiftCopyWith<$Res>? get shift;
}

/// @nodoc
class __$$ShiftDetailStateImplCopyWithImpl<$Res>
    extends _$ShiftDetailStateCopyWithImpl<$Res, _$ShiftDetailStateImpl>
    implements _$$ShiftDetailStateImplCopyWith<$Res> {
  __$$ShiftDetailStateImplCopyWithImpl(
    _$ShiftDetailStateImpl _value,
    $Res Function(_$ShiftDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? shift = freezed,
    Object? action = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$ShiftDetailStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        shift: freezed == shift
            ? _value.shift
            : shift // ignore: cast_nullable_to_non_nullable
                  as Shift?,
        action: freezed == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as ShiftDetailAction?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ShiftDetailStateImpl extends _ShiftDetailState {
  const _$ShiftDetailStateImpl({
    this.viewState = ViewState.initial,
    this.shift,
    this.action,
    this.errorMessage,
  }) : super._();

  @override
  @JsonKey()
  final ViewState viewState;
  @override
  final Shift? shift;
  @override
  final ShiftDetailAction? action;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ShiftDetailState(viewState: $viewState, shift: $shift, action: $action, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftDetailStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, viewState, shift, action, errorMessage);

  /// Create a copy of ShiftDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftDetailStateImplCopyWith<_$ShiftDetailStateImpl> get copyWith =>
      __$$ShiftDetailStateImplCopyWithImpl<_$ShiftDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ShiftDetailState extends ShiftDetailState {
  const factory _ShiftDetailState({
    final ViewState viewState,
    final Shift? shift,
    final ShiftDetailAction? action,
    final String? errorMessage,
  }) = _$ShiftDetailStateImpl;
  const _ShiftDetailState._() : super._();

  @override
  ViewState get viewState;
  @override
  Shift? get shift;
  @override
  ShiftDetailAction? get action;
  @override
  String? get errorMessage;

  /// Create a copy of ShiftDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftDetailStateImplCopyWith<_$ShiftDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
