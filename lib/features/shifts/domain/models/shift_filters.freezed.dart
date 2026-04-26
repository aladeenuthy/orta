// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShiftFilters {
  ShiftStatusFilter? get status => throw _privateConstructorUsedError;
  ShiftSortBy? get sortBy => throw _privateConstructorUsedError;
  ShiftSortOrder? get sortOrder => throw _privateConstructorUsedError;

  /// Create a copy of ShiftFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShiftFiltersCopyWith<ShiftFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShiftFiltersCopyWith<$Res> {
  factory $ShiftFiltersCopyWith(
    ShiftFilters value,
    $Res Function(ShiftFilters) then,
  ) = _$ShiftFiltersCopyWithImpl<$Res, ShiftFilters>;
  @useResult
  $Res call({
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  });
}

/// @nodoc
class _$ShiftFiltersCopyWithImpl<$Res, $Val extends ShiftFilters>
    implements $ShiftFiltersCopyWith<$Res> {
  _$ShiftFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShiftFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ShiftStatusFilter?,
            sortBy: freezed == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                      as ShiftSortBy?,
            sortOrder: freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as ShiftSortOrder?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShiftFiltersImplCopyWith<$Res>
    implements $ShiftFiltersCopyWith<$Res> {
  factory _$$ShiftFiltersImplCopyWith(
    _$ShiftFiltersImpl value,
    $Res Function(_$ShiftFiltersImpl) then,
  ) = __$$ShiftFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  });
}

/// @nodoc
class __$$ShiftFiltersImplCopyWithImpl<$Res>
    extends _$ShiftFiltersCopyWithImpl<$Res, _$ShiftFiltersImpl>
    implements _$$ShiftFiltersImplCopyWith<$Res> {
  __$$ShiftFiltersImplCopyWithImpl(
    _$ShiftFiltersImpl _value,
    $Res Function(_$ShiftFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShiftFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _$ShiftFiltersImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ShiftStatusFilter?,
        sortBy: freezed == sortBy
            ? _value.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as ShiftSortBy?,
        sortOrder: freezed == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as ShiftSortOrder?,
      ),
    );
  }
}

/// @nodoc

class _$ShiftFiltersImpl implements _ShiftFilters {
  const _$ShiftFiltersImpl({this.status, this.sortBy, this.sortOrder});

  @override
  final ShiftStatusFilter? status;
  @override
  final ShiftSortBy? sortBy;
  @override
  final ShiftSortOrder? sortOrder;

  @override
  String toString() {
    return 'ShiftFilters(status: $status, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShiftFiltersImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, sortBy, sortOrder);

  /// Create a copy of ShiftFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShiftFiltersImplCopyWith<_$ShiftFiltersImpl> get copyWith =>
      __$$ShiftFiltersImplCopyWithImpl<_$ShiftFiltersImpl>(this, _$identity);
}

abstract class _ShiftFilters implements ShiftFilters {
  const factory _ShiftFilters({
    final ShiftStatusFilter? status,
    final ShiftSortBy? sortBy,
    final ShiftSortOrder? sortOrder,
  }) = _$ShiftFiltersImpl;

  @override
  ShiftStatusFilter? get status;
  @override
  ShiftSortBy? get sortBy;
  @override
  ShiftSortOrder? get sortOrder;

  /// Create a copy of ShiftFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShiftFiltersImplCopyWith<_$ShiftFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
