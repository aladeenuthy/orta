// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_actions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MarketplaceActionsState {
  ViewState get viewState => throw _privateConstructorUsedError;
  Shift? get claimedShift => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of MarketplaceActionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketplaceActionsStateCopyWith<MarketplaceActionsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketplaceActionsStateCopyWith<$Res> {
  factory $MarketplaceActionsStateCopyWith(
    MarketplaceActionsState value,
    $Res Function(MarketplaceActionsState) then,
  ) = _$MarketplaceActionsStateCopyWithImpl<$Res, MarketplaceActionsState>;
  @useResult
  $Res call({ViewState viewState, Shift? claimedShift, String? errorMessage});

  $ShiftCopyWith<$Res>? get claimedShift;
}

/// @nodoc
class _$MarketplaceActionsStateCopyWithImpl<
  $Res,
  $Val extends MarketplaceActionsState
>
    implements $MarketplaceActionsStateCopyWith<$Res> {
  _$MarketplaceActionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketplaceActionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? claimedShift = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            claimedShift: freezed == claimedShift
                ? _value.claimedShift
                : claimedShift // ignore: cast_nullable_to_non_nullable
                      as Shift?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of MarketplaceActionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShiftCopyWith<$Res>? get claimedShift {
    if (_value.claimedShift == null) {
      return null;
    }

    return $ShiftCopyWith<$Res>(_value.claimedShift!, (value) {
      return _then(_value.copyWith(claimedShift: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MarketplaceActionsStateImplCopyWith<$Res>
    implements $MarketplaceActionsStateCopyWith<$Res> {
  factory _$$MarketplaceActionsStateImplCopyWith(
    _$MarketplaceActionsStateImpl value,
    $Res Function(_$MarketplaceActionsStateImpl) then,
  ) = __$$MarketplaceActionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ViewState viewState, Shift? claimedShift, String? errorMessage});

  @override
  $ShiftCopyWith<$Res>? get claimedShift;
}

/// @nodoc
class __$$MarketplaceActionsStateImplCopyWithImpl<$Res>
    extends
        _$MarketplaceActionsStateCopyWithImpl<
          $Res,
          _$MarketplaceActionsStateImpl
        >
    implements _$$MarketplaceActionsStateImplCopyWith<$Res> {
  __$$MarketplaceActionsStateImplCopyWithImpl(
    _$MarketplaceActionsStateImpl _value,
    $Res Function(_$MarketplaceActionsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketplaceActionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? claimedShift = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$MarketplaceActionsStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        claimedShift: freezed == claimedShift
            ? _value.claimedShift
            : claimedShift // ignore: cast_nullable_to_non_nullable
                  as Shift?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$MarketplaceActionsStateImpl extends _MarketplaceActionsState {
  const _$MarketplaceActionsStateImpl({
    this.viewState = ViewState.initial,
    this.claimedShift,
    this.errorMessage,
  }) : super._();

  @override
  @JsonKey()
  final ViewState viewState;
  @override
  final Shift? claimedShift;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MarketplaceActionsState(viewState: $viewState, claimedShift: $claimedShift, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketplaceActionsStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            (identical(other.claimedShift, claimedShift) ||
                other.claimedShift == claimedShift) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, viewState, claimedShift, errorMessage);

  /// Create a copy of MarketplaceActionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketplaceActionsStateImplCopyWith<_$MarketplaceActionsStateImpl>
  get copyWith =>
      __$$MarketplaceActionsStateImplCopyWithImpl<
        _$MarketplaceActionsStateImpl
      >(this, _$identity);
}

abstract class _MarketplaceActionsState extends MarketplaceActionsState {
  const factory _MarketplaceActionsState({
    final ViewState viewState,
    final Shift? claimedShift,
    final String? errorMessage,
  }) = _$MarketplaceActionsStateImpl;
  const _MarketplaceActionsState._() : super._();

  @override
  ViewState get viewState;
  @override
  Shift? get claimedShift;
  @override
  String? get errorMessage;

  /// Create a copy of MarketplaceActionsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketplaceActionsStateImplCopyWith<_$MarketplaceActionsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
