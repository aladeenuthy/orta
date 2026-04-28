// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unavailability_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UnavailabilityState {
  ViewState get viewState => throw _privateConstructorUsedError;
  List<UnavailabilityPeriod> get items => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of UnavailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnavailabilityStateCopyWith<UnavailabilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnavailabilityStateCopyWith<$Res> {
  factory $UnavailabilityStateCopyWith(
    UnavailabilityState value,
    $Res Function(UnavailabilityState) then,
  ) = _$UnavailabilityStateCopyWithImpl<$Res, UnavailabilityState>;
  @useResult
  $Res call({
    ViewState viewState,
    List<UnavailabilityPeriod> items,
    String? errorMessage,
  });
}

/// @nodoc
class _$UnavailabilityStateCopyWithImpl<$Res, $Val extends UnavailabilityState>
    implements $UnavailabilityStateCopyWith<$Res> {
  _$UnavailabilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnavailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? items = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            viewState: null == viewState
                ? _value.viewState
                : viewState // ignore: cast_nullable_to_non_nullable
                      as ViewState,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<UnavailabilityPeriod>,
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
abstract class _$$UnavailabilityStateImplCopyWith<$Res>
    implements $UnavailabilityStateCopyWith<$Res> {
  factory _$$UnavailabilityStateImplCopyWith(
    _$UnavailabilityStateImpl value,
    $Res Function(_$UnavailabilityStateImpl) then,
  ) = __$$UnavailabilityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ViewState viewState,
    List<UnavailabilityPeriod> items,
    String? errorMessage,
  });
}

/// @nodoc
class __$$UnavailabilityStateImplCopyWithImpl<$Res>
    extends _$UnavailabilityStateCopyWithImpl<$Res, _$UnavailabilityStateImpl>
    implements _$$UnavailabilityStateImplCopyWith<$Res> {
  __$$UnavailabilityStateImplCopyWithImpl(
    _$UnavailabilityStateImpl _value,
    $Res Function(_$UnavailabilityStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UnavailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? items = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$UnavailabilityStateImpl(
        viewState: null == viewState
            ? _value.viewState
            : viewState // ignore: cast_nullable_to_non_nullable
                  as ViewState,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<UnavailabilityPeriod>,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UnavailabilityStateImpl extends _UnavailabilityState {
  const _$UnavailabilityStateImpl({
    this.viewState = ViewState.initial,
    final List<UnavailabilityPeriod> items = const <UnavailabilityPeriod>[],
    this.errorMessage,
  }) : _items = items,
       super._();

  @override
  @JsonKey()
  final ViewState viewState;
  final List<UnavailabilityPeriod> _items;
  @override
  @JsonKey()
  List<UnavailabilityPeriod> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UnavailabilityState(viewState: $viewState, items: $items, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnavailabilityStateImpl &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    viewState,
    const DeepCollectionEquality().hash(_items),
    errorMessage,
  );

  /// Create a copy of UnavailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnavailabilityStateImplCopyWith<_$UnavailabilityStateImpl> get copyWith =>
      __$$UnavailabilityStateImplCopyWithImpl<_$UnavailabilityStateImpl>(
        this,
        _$identity,
      );
}

abstract class _UnavailabilityState extends UnavailabilityState {
  const factory _UnavailabilityState({
    final ViewState viewState,
    final List<UnavailabilityPeriod> items,
    final String? errorMessage,
  }) = _$UnavailabilityStateImpl;
  const _UnavailabilityState._() : super._();

  @override
  ViewState get viewState;
  @override
  List<UnavailabilityPeriod> get items;
  @override
  String? get errorMessage;

  /// Create a copy of UnavailabilityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnavailabilityStateImplCopyWith<_$UnavailabilityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
