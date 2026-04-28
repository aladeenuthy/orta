// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AvailabilityState {
  ViewState get viewState => throw _privateConstructorUsedError;
  List<AvailabilityDay> get weeklySchedule =>
      throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  DateTime? get referenceWeekStart => throw _privateConstructorUsedError;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailabilityStateCopyWith<AvailabilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailabilityStateCopyWith<$Res> {
  factory $AvailabilityStateCopyWith(
    AvailabilityState value,
    $Res Function(AvailabilityState) then,
  ) = _$AvailabilityStateCopyWithImpl<$Res, AvailabilityState>;
  @useResult
  $Res call({
    ViewState viewState,
    List<AvailabilityDay> weeklySchedule,
    String errorMessage,
    DateTime? referenceWeekStart,
  });
}

/// @nodoc
class _$AvailabilityStateCopyWithImpl<$Res, $Val extends AvailabilityState>
    implements $AvailabilityStateCopyWith<$Res> {
  _$AvailabilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? weeklySchedule = null,
    Object? errorMessage = null,
    Object? referenceWeekStart = freezed,
  }) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            weeklySchedule: null == weeklySchedule
                ? _value.weeklySchedule
                : weeklySchedule // ignore: cast_nullable_to_non_nullable
                      as List<AvailabilityDay>,
            errorMessage: null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            referenceWeekStart: freezed == referenceWeekStart
                ? _value.referenceWeekStart
                : referenceWeekStart // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailabilityStateImplCopyWith<$Res>
    implements $AvailabilityStateCopyWith<$Res> {
  factory _$$AvailabilityStateImplCopyWith(
    _$AvailabilityStateImpl value,
    $Res Function(_$AvailabilityStateImpl) then,
  ) = __$$AvailabilityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ViewState viewState,
    List<AvailabilityDay> weeklySchedule,
    String errorMessage,
    DateTime? referenceWeekStart,
  });
}

/// @nodoc
class __$$AvailabilityStateImplCopyWithImpl<$Res>
    extends _$AvailabilityStateCopyWithImpl<$Res, _$AvailabilityStateImpl>
    implements _$$AvailabilityStateImplCopyWith<$Res> {
  __$$AvailabilityStateImplCopyWithImpl(
    _$AvailabilityStateImpl _value,
    $Res Function(_$AvailabilityStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? weeklySchedule = null,
    Object? errorMessage = null,
    Object? referenceWeekStart = freezed,
  }) {
    return _then(
      _$AvailabilityStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        weeklySchedule: null == weeklySchedule
            ? _value._weeklySchedule
            : weeklySchedule // ignore: cast_nullable_to_non_nullable
                  as List<AvailabilityDay>,
        errorMessage: null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        referenceWeekStart: freezed == referenceWeekStart
            ? _value.referenceWeekStart
            : referenceWeekStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$AvailabilityStateImpl extends _AvailabilityState {
  const _$AvailabilityStateImpl({
    this.viewState = ViewState.initial,
    required final List<AvailabilityDay> weeklySchedule,
    this.errorMessage = '',
    this.referenceWeekStart,
  }) : _weeklySchedule = weeklySchedule,
       super._();

  @override
  @JsonKey()
  final ViewState viewState;
  final List<AvailabilityDay> _weeklySchedule;
  @override
  List<AvailabilityDay> get weeklySchedule {
    if (_weeklySchedule is EqualUnmodifiableListView) return _weeklySchedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklySchedule);
  }

  @override
  @JsonKey()
  final String errorMessage;
  @override
  final DateTime? referenceWeekStart;

  @override
  String toString() {
    return 'AvailabilityState(viewState: $viewState, weeklySchedule: $weeklySchedule, errorMessage: $errorMessage, referenceWeekStart: $referenceWeekStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailabilityStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            const DeepCollectionEquality().equals(
              other._weeklySchedule,
              _weeklySchedule,
            ) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.referenceWeekStart, referenceWeekStart) ||
                other.referenceWeekStart == referenceWeekStart));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    viewState,
    const DeepCollectionEquality().hash(_weeklySchedule),
    errorMessage,
    referenceWeekStart,
  );

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailabilityStateImplCopyWith<_$AvailabilityStateImpl> get copyWith =>
      __$$AvailabilityStateImplCopyWithImpl<_$AvailabilityStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AvailabilityState extends AvailabilityState {
  const factory _AvailabilityState({
    final ViewState viewState,
    required final List<AvailabilityDay> weeklySchedule,
    final String errorMessage,
    final DateTime? referenceWeekStart,
  }) = _$AvailabilityStateImpl;
  const _AvailabilityState._() : super._();

  @override
  ViewState get viewState;
  @override
  List<AvailabilityDay> get weeklySchedule;
  @override
  String get errorMessage;
  @override
  DateTime? get referenceWeekStart;

  /// Create a copy of AvailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailabilityStateImplCopyWith<_$AvailabilityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
