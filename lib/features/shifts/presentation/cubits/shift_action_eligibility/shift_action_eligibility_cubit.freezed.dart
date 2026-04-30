// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_action_eligibility_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShiftActionEligibilityState {
  ViewState get viewState => throw _privateConstructorUsedError;
  ShiftActionEligibility? get eligibility => throw _privateConstructorUsedError;

  /// Create a copy of ShiftActionEligibilityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftActionEligibilityStateCopyWith<ShiftActionEligibilityState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftActionEligibilityStateCopyWith<$Res> {
  factory $ShiftActionEligibilityStateCopyWith(
    ShiftActionEligibilityState value,
    $Res Function(ShiftActionEligibilityState) then,
  ) =
      _$ShiftActionEligibilityStateCopyWithImpl<
        $Res,
        ShiftActionEligibilityState
      >;
  @useResult
  $Res call({ViewState viewState, ShiftActionEligibility? eligibility});

  $ShiftActionEligibilityCopyWith<$Res>? get eligibility;
}

/// @nodoc
class _$ShiftActionEligibilityStateCopyWithImpl<
  $Res,
  $Val extends ShiftActionEligibilityState
>
    implements $ShiftActionEligibilityStateCopyWith<$Res> {
  _$ShiftActionEligibilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftActionEligibilityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? viewState = null, Object? eligibility = freezed}) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            eligibility: freezed == eligibility
                ? _value.eligibility
                : eligibility // ignore: cast_nullable_to_non_nullable
                      as ShiftActionEligibility?,
          )
          as $Val,
    );
  }

  /// Create a copy of ShiftActionEligibilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShiftActionEligibilityCopyWith<$Res>? get eligibility {
    if (_value.eligibility == null) {
      return null;
    }

    return $ShiftActionEligibilityCopyWith<$Res>(_value.eligibility!, (value) {
      return _then(_value.copyWith(eligibility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShiftActionEligibilityStateImplCopyWith<$Res>
    implements $ShiftActionEligibilityStateCopyWith<$Res> {
  factory _$$ShiftActionEligibilityStateImplCopyWith(
    _$ShiftActionEligibilityStateImpl value,
    $Res Function(_$ShiftActionEligibilityStateImpl) then,
  ) = __$$ShiftActionEligibilityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ViewState viewState, ShiftActionEligibility? eligibility});

  @override
  $ShiftActionEligibilityCopyWith<$Res>? get eligibility;
}

/// @nodoc
class __$$ShiftActionEligibilityStateImplCopyWithImpl<$Res>
    extends
        _$ShiftActionEligibilityStateCopyWithImpl<
          $Res,
          _$ShiftActionEligibilityStateImpl
        >
    implements _$$ShiftActionEligibilityStateImplCopyWith<$Res> {
  __$$ShiftActionEligibilityStateImplCopyWithImpl(
    _$ShiftActionEligibilityStateImpl _value,
    $Res Function(_$ShiftActionEligibilityStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftActionEligibilityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? viewState = null, Object? eligibility = freezed}) {
    return _then(
      _$ShiftActionEligibilityStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        eligibility: freezed == eligibility
            ? _value.eligibility
            : eligibility // ignore: cast_nullable_to_non_nullable
                  as ShiftActionEligibility?,
      ),
    );
  }
}

/// @nodoc

class _$ShiftActionEligibilityStateImpl extends _ShiftActionEligibilityState {
  const _$ShiftActionEligibilityStateImpl({
    this.viewState = ViewState.initial,
    this.eligibility,
  }) : super._();

  @override
  @JsonKey()
  final ViewState viewState;
  @override
  final ShiftActionEligibility? eligibility;

  @override
  String toString() {
    return 'ShiftActionEligibilityState(viewState: $viewState, eligibility: $eligibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftActionEligibilityStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            (identical(other.eligibility, eligibility) ||
                other.eligibility == eligibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewState, eligibility);

  /// Create a copy of ShiftActionEligibilityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftActionEligibilityStateImplCopyWith<_$ShiftActionEligibilityStateImpl>
  get copyWith =>
      __$$ShiftActionEligibilityStateImplCopyWithImpl<
        _$ShiftActionEligibilityStateImpl
      >(this, _$identity);
}

abstract class _ShiftActionEligibilityState
    extends ShiftActionEligibilityState {
  const factory _ShiftActionEligibilityState({
    final ViewState viewState,
    final ShiftActionEligibility? eligibility,
  }) = _$ShiftActionEligibilityStateImpl;
  const _ShiftActionEligibilityState._() : super._();

  @override
  ViewState get viewState;
  @override
  ShiftActionEligibility? get eligibility;

  /// Create a copy of ShiftActionEligibilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftActionEligibilityStateImplCopyWith<_$ShiftActionEligibilityStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
