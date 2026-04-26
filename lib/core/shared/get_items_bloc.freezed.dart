// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_items_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetItemsEvent<T, D> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetItemsEventCopyWith<T, D, $Res> {
  factory $GetItemsEventCopyWith(
    GetItemsEvent<T, D> value,
    $Res Function(GetItemsEvent<T, D>) then,
  ) = _$GetItemsEventCopyWithImpl<T, D, $Res, GetItemsEvent<T, D>>;
}

/// @nodoc
class _$GetItemsEventCopyWithImpl<T, D, $Res, $Val extends GetItemsEvent<T, D>>
    implements $GetItemsEventCopyWith<T, D, $Res> {
  _$GetItemsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetItemsLoadMoreEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsLoadMoreEventImplCopyWith(
    _$GetItemsLoadMoreEventImpl<T, D> value,
    $Res Function(_$GetItemsLoadMoreEventImpl<T, D>) then,
  ) = __$$GetItemsLoadMoreEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({bool bypassCache, D? optionalData});
}

/// @nodoc
class __$$GetItemsLoadMoreEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<
          T,
          D,
          $Res,
          _$GetItemsLoadMoreEventImpl<T, D>
        >
    implements _$$GetItemsLoadMoreEventImplCopyWith<T, D, $Res> {
  __$$GetItemsLoadMoreEventImplCopyWithImpl(
    _$GetItemsLoadMoreEventImpl<T, D> _value,
    $Res Function(_$GetItemsLoadMoreEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? bypassCache = null, Object? optionalData = freezed}) {
    return _then(
      _$GetItemsLoadMoreEventImpl<T, D>(
        bypassCache: null == bypassCache
            ? _value.bypassCache
            : bypassCache // ignore: cast_nullable_to_non_nullable
                  as bool,
        optionalData: freezed == optionalData
            ? _value.optionalData
            : optionalData // ignore: cast_nullable_to_non_nullable
                  as D?,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsLoadMoreEventImpl<T, D> implements GetItemsLoadMoreEvent<T, D> {
  const _$GetItemsLoadMoreEventImpl({
    required this.bypassCache,
    this.optionalData,
  });

  @override
  final bool bypassCache;
  @override
  final D? optionalData;

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.loadMore(bypassCache: $bypassCache, optionalData: $optionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsLoadMoreEventImpl<T, D> &&
            (identical(other.bypassCache, bypassCache) ||
                other.bypassCache == bypassCache) &&
            const DeepCollectionEquality().equals(
              other.optionalData,
              optionalData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bypassCache,
    const DeepCollectionEquality().hash(optionalData),
  );

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsLoadMoreEventImplCopyWith<T, D, _$GetItemsLoadMoreEventImpl<T, D>>
  get copyWith =>
      __$$GetItemsLoadMoreEventImplCopyWithImpl<
        T,
        D,
        _$GetItemsLoadMoreEventImpl<T, D>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return loadMore(bypassCache, optionalData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return loadMore?.call(bypassCache, optionalData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(bypassCache, optionalData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class GetItemsLoadMoreEvent<T, D> implements GetItemsEvent<T, D> {
  const factory GetItemsLoadMoreEvent({
    required final bool bypassCache,
    final D? optionalData,
  }) = _$GetItemsLoadMoreEventImpl<T, D>;

  bool get bypassCache;
  D? get optionalData;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsLoadMoreEventImplCopyWith<T, D, _$GetItemsLoadMoreEventImpl<T, D>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsGetEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsGetEventImplCopyWith(
    _$GetItemsGetEventImpl<T, D> value,
    $Res Function(_$GetItemsGetEventImpl<T, D>) then,
  ) = __$$GetItemsGetEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({
    String searchQuery,
    int offset,
    int limit,
    bool bypassCache,
    D? optionalData,
  });
}

/// @nodoc
class __$$GetItemsGetEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<T, D, $Res, _$GetItemsGetEventImpl<T, D>>
    implements _$$GetItemsGetEventImplCopyWith<T, D, $Res> {
  __$$GetItemsGetEventImplCopyWithImpl(
    _$GetItemsGetEventImpl<T, D> _value,
    $Res Function(_$GetItemsGetEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? offset = null,
    Object? limit = null,
    Object? bypassCache = null,
    Object? optionalData = freezed,
  }) {
    return _then(
      _$GetItemsGetEventImpl<T, D>(
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        bypassCache: null == bypassCache
            ? _value.bypassCache
            : bypassCache // ignore: cast_nullable_to_non_nullable
                  as bool,
        optionalData: freezed == optionalData
            ? _value.optionalData
            : optionalData // ignore: cast_nullable_to_non_nullable
                  as D?,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsGetEventImpl<T, D> implements GetItemsGetEvent<T, D> {
  const _$GetItemsGetEventImpl({
    this.searchQuery = '',
    this.offset = 0,
    this.limit = 10,
    required this.bypassCache,
    this.optionalData,
  });

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final int limit;
  @override
  final bool bypassCache;
  @override
  final D? optionalData;

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.get(searchQuery: $searchQuery, offset: $offset, limit: $limit, bypassCache: $bypassCache, optionalData: $optionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsGetEventImpl<T, D> &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.bypassCache, bypassCache) ||
                other.bypassCache == bypassCache) &&
            const DeepCollectionEquality().equals(
              other.optionalData,
              optionalData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    searchQuery,
    offset,
    limit,
    bypassCache,
    const DeepCollectionEquality().hash(optionalData),
  );

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsGetEventImplCopyWith<T, D, _$GetItemsGetEventImpl<T, D>>
  get copyWith =>
      __$$GetItemsGetEventImplCopyWithImpl<T, D, _$GetItemsGetEventImpl<T, D>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return get(searchQuery, offset, limit, bypassCache, optionalData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return get?.call(searchQuery, offset, limit, bypassCache, optionalData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(searchQuery, offset, limit, bypassCache, optionalData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetItemsGetEvent<T, D> implements GetItemsEvent<T, D> {
  const factory GetItemsGetEvent({
    final String searchQuery,
    final int offset,
    final int limit,
    required final bool bypassCache,
    final D? optionalData,
  }) = _$GetItemsGetEventImpl<T, D>;

  String get searchQuery;
  int get offset;
  int get limit;
  bool get bypassCache;
  D? get optionalData;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsGetEventImplCopyWith<T, D, _$GetItemsGetEventImpl<T, D>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsUpdateItemEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsUpdateItemEventImplCopyWith(
    _$GetItemsUpdateItemEventImpl<T, D> value,
    $Res Function(_$GetItemsUpdateItemEventImpl<T, D>) then,
  ) = __$$GetItemsUpdateItemEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({T item});
}

/// @nodoc
class __$$GetItemsUpdateItemEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<
          T,
          D,
          $Res,
          _$GetItemsUpdateItemEventImpl<T, D>
        >
    implements _$$GetItemsUpdateItemEventImplCopyWith<T, D, $Res> {
  __$$GetItemsUpdateItemEventImplCopyWithImpl(
    _$GetItemsUpdateItemEventImpl<T, D> _value,
    $Res Function(_$GetItemsUpdateItemEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _$GetItemsUpdateItemEventImpl<T, D>(
        item: freezed == item
            ? _value.item
            : item // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsUpdateItemEventImpl<T, D>
    implements GetItemsUpdateItemEvent<T, D> {
  const _$GetItemsUpdateItemEventImpl({required this.item});

  @override
  final T item;

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.updateItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsUpdateItemEventImpl<T, D> &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsUpdateItemEventImplCopyWith<
    T,
    D,
    _$GetItemsUpdateItemEventImpl<T, D>
  >
  get copyWith =>
      __$$GetItemsUpdateItemEventImplCopyWithImpl<
        T,
        D,
        _$GetItemsUpdateItemEventImpl<T, D>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return updateItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return updateItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (updateItem != null) {
      return updateItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return updateItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return updateItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (updateItem != null) {
      return updateItem(this);
    }
    return orElse();
  }
}

abstract class GetItemsUpdateItemEvent<T, D> implements GetItemsEvent<T, D> {
  const factory GetItemsUpdateItemEvent({required final T item}) =
      _$GetItemsUpdateItemEventImpl<T, D>;

  T get item;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsUpdateItemEventImplCopyWith<
    T,
    D,
    _$GetItemsUpdateItemEventImpl<T, D>
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsRemoveItemEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsRemoveItemEventImplCopyWith(
    _$GetItemsRemoveItemEventImpl<T, D> value,
    $Res Function(_$GetItemsRemoveItemEventImpl<T, D>) then,
  ) = __$$GetItemsRemoveItemEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({T item});
}

/// @nodoc
class __$$GetItemsRemoveItemEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<
          T,
          D,
          $Res,
          _$GetItemsRemoveItemEventImpl<T, D>
        >
    implements _$$GetItemsRemoveItemEventImplCopyWith<T, D, $Res> {
  __$$GetItemsRemoveItemEventImplCopyWithImpl(
    _$GetItemsRemoveItemEventImpl<T, D> _value,
    $Res Function(_$GetItemsRemoveItemEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _$GetItemsRemoveItemEventImpl<T, D>(
        item: freezed == item
            ? _value.item
            : item // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsRemoveItemEventImpl<T, D>
    implements GetItemsRemoveItemEvent<T, D> {
  const _$GetItemsRemoveItemEventImpl({required this.item});

  @override
  final T item;

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.removeItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsRemoveItemEventImpl<T, D> &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsRemoveItemEventImplCopyWith<
    T,
    D,
    _$GetItemsRemoveItemEventImpl<T, D>
  >
  get copyWith =>
      __$$GetItemsRemoveItemEventImplCopyWithImpl<
        T,
        D,
        _$GetItemsRemoveItemEventImpl<T, D>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return removeItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return removeItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return removeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return removeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(this);
    }
    return orElse();
  }
}

abstract class GetItemsRemoveItemEvent<T, D> implements GetItemsEvent<T, D> {
  const factory GetItemsRemoveItemEvent({required final T item}) =
      _$GetItemsRemoveItemEventImpl<T, D>;

  T get item;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsRemoveItemEventImplCopyWith<
    T,
    D,
    _$GetItemsRemoveItemEventImpl<T, D>
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsRemoveItemsEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsRemoveItemsEventImplCopyWith(
    _$GetItemsRemoveItemsEventImpl<T, D> value,
    $Res Function(_$GetItemsRemoveItemsEventImpl<T, D>) then,
  ) = __$$GetItemsRemoveItemsEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$GetItemsRemoveItemsEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<
          T,
          D,
          $Res,
          _$GetItemsRemoveItemsEventImpl<T, D>
        >
    implements _$$GetItemsRemoveItemsEventImplCopyWith<T, D, $Res> {
  __$$GetItemsRemoveItemsEventImplCopyWithImpl(
    _$GetItemsRemoveItemsEventImpl<T, D> _value,
    $Res Function(_$GetItemsRemoveItemsEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$GetItemsRemoveItemsEventImpl<T, D>(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsRemoveItemsEventImpl<T, D>
    implements GetItemsRemoveItemsEvent<T, D> {
  const _$GetItemsRemoveItemsEventImpl({required final List<T> items})
    : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.removeItems(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsRemoveItemsEventImpl<T, D> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsRemoveItemsEventImplCopyWith<
    T,
    D,
    _$GetItemsRemoveItemsEventImpl<T, D>
  >
  get copyWith =>
      __$$GetItemsRemoveItemsEventImplCopyWithImpl<
        T,
        D,
        _$GetItemsRemoveItemsEventImpl<T, D>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return removeItems(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return removeItems?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (removeItems != null) {
      return removeItems(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return removeItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return removeItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (removeItems != null) {
      return removeItems(this);
    }
    return orElse();
  }
}

abstract class GetItemsRemoveItemsEvent<T, D> implements GetItemsEvent<T, D> {
  const factory GetItemsRemoveItemsEvent({required final List<T> items}) =
      _$GetItemsRemoveItemsEventImpl<T, D>;

  List<T> get items;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsRemoveItemsEventImplCopyWith<
    T,
    D,
    _$GetItemsRemoveItemsEventImpl<T, D>
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsAddItemEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsAddItemEventImplCopyWith(
    _$GetItemsAddItemEventImpl<T, D> value,
    $Res Function(_$GetItemsAddItemEventImpl<T, D>) then,
  ) = __$$GetItemsAddItemEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({T item});
}

/// @nodoc
class __$$GetItemsAddItemEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<
          T,
          D,
          $Res,
          _$GetItemsAddItemEventImpl<T, D>
        >
    implements _$$GetItemsAddItemEventImplCopyWith<T, D, $Res> {
  __$$GetItemsAddItemEventImplCopyWithImpl(
    _$GetItemsAddItemEventImpl<T, D> _value,
    $Res Function(_$GetItemsAddItemEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = freezed}) {
    return _then(
      _$GetItemsAddItemEventImpl<T, D>(
        item: freezed == item
            ? _value.item
            : item // ignore: cast_nullable_to_non_nullable
                  as T,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsAddItemEventImpl<T, D> implements GetItemsAddItemEvent<T, D> {
  const _$GetItemsAddItemEventImpl({required this.item});

  @override
  final T item;

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.addItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsAddItemEventImpl<T, D> &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsAddItemEventImplCopyWith<T, D, _$GetItemsAddItemEventImpl<T, D>>
  get copyWith =>
      __$$GetItemsAddItemEventImplCopyWithImpl<
        T,
        D,
        _$GetItemsAddItemEventImpl<T, D>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return addItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return addItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return addItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return addItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(this);
    }
    return orElse();
  }
}

abstract class GetItemsAddItemEvent<T, D> implements GetItemsEvent<T, D> {
  const factory GetItemsAddItemEvent({required final T item}) =
      _$GetItemsAddItemEventImpl<T, D>;

  T get item;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsAddItemEventImplCopyWith<T, D, _$GetItemsAddItemEventImpl<T, D>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsAddItemsEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsAddItemsEventImplCopyWith(
    _$GetItemsAddItemsEventImpl<T, D> value,
    $Res Function(_$GetItemsAddItemsEventImpl<T, D>) then,
  ) = __$$GetItemsAddItemsEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$GetItemsAddItemsEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<
          T,
          D,
          $Res,
          _$GetItemsAddItemsEventImpl<T, D>
        >
    implements _$$GetItemsAddItemsEventImplCopyWith<T, D, $Res> {
  __$$GetItemsAddItemsEventImplCopyWithImpl(
    _$GetItemsAddItemsEventImpl<T, D> _value,
    $Res Function(_$GetItemsAddItemsEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$GetItemsAddItemsEventImpl<T, D>(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsAddItemsEventImpl<T, D> implements GetItemsAddItemsEvent<T, D> {
  const _$GetItemsAddItemsEventImpl({required final List<T> items})
    : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.addItems(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsAddItemsEventImpl<T, D> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsAddItemsEventImplCopyWith<T, D, _$GetItemsAddItemsEventImpl<T, D>>
  get copyWith =>
      __$$GetItemsAddItemsEventImplCopyWithImpl<
        T,
        D,
        _$GetItemsAddItemsEventImpl<T, D>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return addItems(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return addItems?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (addItems != null) {
      return addItems(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return addItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return addItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (addItems != null) {
      return addItems(this);
    }
    return orElse();
  }
}

abstract class GetItemsAddItemsEvent<T, D> implements GetItemsEvent<T, D> {
  const factory GetItemsAddItemsEvent({required final List<T> items}) =
      _$GetItemsAddItemsEventImpl<T, D>;

  List<T> get items;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsAddItemsEventImplCopyWith<T, D, _$GetItemsAddItemsEventImpl<T, D>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsResetEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsResetEventImplCopyWith(
    _$GetItemsResetEventImpl<T, D> value,
    $Res Function(_$GetItemsResetEventImpl<T, D>) then,
  ) = __$$GetItemsResetEventImplCopyWithImpl<T, D, $Res>;
}

/// @nodoc
class __$$GetItemsResetEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<T, D, $Res, _$GetItemsResetEventImpl<T, D>>
    implements _$$GetItemsResetEventImplCopyWith<T, D, $Res> {
  __$$GetItemsResetEventImplCopyWithImpl(
    _$GetItemsResetEventImpl<T, D> _value,
    $Res Function(_$GetItemsResetEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetItemsResetEventImpl<T, D> implements GetItemsResetEvent<T, D> {
  const _$GetItemsResetEventImpl();

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsResetEventImpl<T, D>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class GetItemsResetEvent<T, D> implements GetItemsEvent<T, D> {
  const factory GetItemsResetEvent() = _$GetItemsResetEventImpl<T, D>;
}

/// @nodoc
abstract class _$$GetItemsUpdateHiddenItemsEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsUpdateHiddenItemsEventImplCopyWith(
    _$GetItemsUpdateHiddenItemsEventImpl<T, D> value,
    $Res Function(_$GetItemsUpdateHiddenItemsEventImpl<T, D>) then,
  ) = __$$GetItemsUpdateHiddenItemsEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$GetItemsUpdateHiddenItemsEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<
          T,
          D,
          $Res,
          _$GetItemsUpdateHiddenItemsEventImpl<T, D>
        >
    implements _$$GetItemsUpdateHiddenItemsEventImplCopyWith<T, D, $Res> {
  __$$GetItemsUpdateHiddenItemsEventImplCopyWithImpl(
    _$GetItemsUpdateHiddenItemsEventImpl<T, D> _value,
    $Res Function(_$GetItemsUpdateHiddenItemsEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$GetItemsUpdateHiddenItemsEventImpl<T, D>(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsUpdateHiddenItemsEventImpl<T, D>
    implements GetItemsUpdateHiddenItemsEvent<T, D> {
  const _$GetItemsUpdateHiddenItemsEventImpl({required final List<T> items})
    : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.updateHiddenItems(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsUpdateHiddenItemsEventImpl<T, D> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsUpdateHiddenItemsEventImplCopyWith<
    T,
    D,
    _$GetItemsUpdateHiddenItemsEventImpl<T, D>
  >
  get copyWith =>
      __$$GetItemsUpdateHiddenItemsEventImplCopyWithImpl<
        T,
        D,
        _$GetItemsUpdateHiddenItemsEventImpl<T, D>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return updateHiddenItems(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return updateHiddenItems?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (updateHiddenItems != null) {
      return updateHiddenItems(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return updateHiddenItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return updateHiddenItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (updateHiddenItems != null) {
      return updateHiddenItems(this);
    }
    return orElse();
  }
}

abstract class GetItemsUpdateHiddenItemsEvent<T, D>
    implements GetItemsEvent<T, D> {
  const factory GetItemsUpdateHiddenItemsEvent({required final List<T> items}) =
      _$GetItemsUpdateHiddenItemsEventImpl<T, D>;

  List<T> get items;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsUpdateHiddenItemsEventImplCopyWith<
    T,
    D,
    _$GetItemsUpdateHiddenItemsEventImpl<T, D>
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsUpdateShownItemsEventImplCopyWith<T, D, $Res> {
  factory _$$GetItemsUpdateShownItemsEventImplCopyWith(
    _$GetItemsUpdateShownItemsEventImpl<T, D> value,
    $Res Function(_$GetItemsUpdateShownItemsEventImpl<T, D>) then,
  ) = __$$GetItemsUpdateShownItemsEventImplCopyWithImpl<T, D, $Res>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$GetItemsUpdateShownItemsEventImplCopyWithImpl<T, D, $Res>
    extends
        _$GetItemsEventCopyWithImpl<
          T,
          D,
          $Res,
          _$GetItemsUpdateShownItemsEventImpl<T, D>
        >
    implements _$$GetItemsUpdateShownItemsEventImplCopyWith<T, D, $Res> {
  __$$GetItemsUpdateShownItemsEventImplCopyWithImpl(
    _$GetItemsUpdateShownItemsEventImpl<T, D> _value,
    $Res Function(_$GetItemsUpdateShownItemsEventImpl<T, D>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$GetItemsUpdateShownItemsEventImpl<T, D>(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsUpdateShownItemsEventImpl<T, D>
    implements GetItemsUpdateShownItemsEvent<T, D> {
  const _$GetItemsUpdateShownItemsEventImpl({required final List<T> items})
    : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'GetItemsEvent<$T, $D>.updateShownItems(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsUpdateShownItemsEventImpl<T, D> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsUpdateShownItemsEventImplCopyWith<
    T,
    D,
    _$GetItemsUpdateShownItemsEventImpl<T, D>
  >
  get copyWith =>
      __$$GetItemsUpdateShownItemsEventImplCopyWithImpl<
        T,
        D,
        _$GetItemsUpdateShownItemsEventImpl<T, D>
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool bypassCache, D? optionalData) loadMore,
    required TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )
    get,
    required TResult Function(T item) updateItem,
    required TResult Function(T item) removeItem,
    required TResult Function(List<T> items) removeItems,
    required TResult Function(T item) addItem,
    required TResult Function(List<T> items) addItems,
    required TResult Function() reset,
    required TResult Function(List<T> items) updateHiddenItems,
    required TResult Function(List<T> items) updateShownItems,
  }) {
    return updateShownItems(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool bypassCache, D? optionalData)? loadMore,
    TResult? Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult? Function(T item)? updateItem,
    TResult? Function(T item)? removeItem,
    TResult? Function(List<T> items)? removeItems,
    TResult? Function(T item)? addItem,
    TResult? Function(List<T> items)? addItems,
    TResult? Function()? reset,
    TResult? Function(List<T> items)? updateHiddenItems,
    TResult? Function(List<T> items)? updateShownItems,
  }) {
    return updateShownItems?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool bypassCache, D? optionalData)? loadMore,
    TResult Function(
      String searchQuery,
      int offset,
      int limit,
      bool bypassCache,
      D? optionalData,
    )?
    get,
    TResult Function(T item)? updateItem,
    TResult Function(T item)? removeItem,
    TResult Function(List<T> items)? removeItems,
    TResult Function(T item)? addItem,
    TResult Function(List<T> items)? addItems,
    TResult Function()? reset,
    TResult Function(List<T> items)? updateHiddenItems,
    TResult Function(List<T> items)? updateShownItems,
    required TResult orElse(),
  }) {
    if (updateShownItems != null) {
      return updateShownItems(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsLoadMoreEvent<T, D> value) loadMore,
    required TResult Function(GetItemsGetEvent<T, D> value) get,
    required TResult Function(GetItemsUpdateItemEvent<T, D> value) updateItem,
    required TResult Function(GetItemsRemoveItemEvent<T, D> value) removeItem,
    required TResult Function(GetItemsRemoveItemsEvent<T, D> value) removeItems,
    required TResult Function(GetItemsAddItemEvent<T, D> value) addItem,
    required TResult Function(GetItemsAddItemsEvent<T, D> value) addItems,
    required TResult Function(GetItemsResetEvent<T, D> value) reset,
    required TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)
    updateHiddenItems,
    required TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)
    updateShownItems,
  }) {
    return updateShownItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult? Function(GetItemsGetEvent<T, D> value)? get,
    TResult? Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult? Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult? Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult? Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult? Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult? Function(GetItemsResetEvent<T, D> value)? reset,
    TResult? Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult? Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
  }) {
    return updateShownItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsLoadMoreEvent<T, D> value)? loadMore,
    TResult Function(GetItemsGetEvent<T, D> value)? get,
    TResult Function(GetItemsUpdateItemEvent<T, D> value)? updateItem,
    TResult Function(GetItemsRemoveItemEvent<T, D> value)? removeItem,
    TResult Function(GetItemsRemoveItemsEvent<T, D> value)? removeItems,
    TResult Function(GetItemsAddItemEvent<T, D> value)? addItem,
    TResult Function(GetItemsAddItemsEvent<T, D> value)? addItems,
    TResult Function(GetItemsResetEvent<T, D> value)? reset,
    TResult Function(GetItemsUpdateHiddenItemsEvent<T, D> value)?
    updateHiddenItems,
    TResult Function(GetItemsUpdateShownItemsEvent<T, D> value)?
    updateShownItems,
    required TResult orElse(),
  }) {
    if (updateShownItems != null) {
      return updateShownItems(this);
    }
    return orElse();
  }
}

abstract class GetItemsUpdateShownItemsEvent<T, D>
    implements GetItemsEvent<T, D> {
  const factory GetItemsUpdateShownItemsEvent({required final List<T> items}) =
      _$GetItemsUpdateShownItemsEventImpl<T, D>;

  List<T> get items;

  /// Create a copy of GetItemsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsUpdateShownItemsEventImplCopyWith<
    T,
    D,
    _$GetItemsUpdateShownItemsEventImpl<T, D>
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetItemsState<T> {
  PaginatedResponse<T>? get response => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  List<T> get hiddenItems => throw _privateConstructorUsedError;
  List<T> get shownItems => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    initial,
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    loading,
    required TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    success,
    required TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult? Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult? Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsInitial<T> value) initial,
    required TResult Function(GetItemsLoading<T> value) loading,
    required TResult Function(GetItemsSuccess<T> value) success,
    required TResult Function(GetItemsFailure<T> value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsInitial<T> value)? initial,
    TResult? Function(GetItemsLoading<T> value)? loading,
    TResult? Function(GetItemsSuccess<T> value)? success,
    TResult? Function(GetItemsFailure<T> value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsInitial<T> value)? initial,
    TResult Function(GetItemsLoading<T> value)? loading,
    TResult Function(GetItemsSuccess<T> value)? success,
    TResult Function(GetItemsFailure<T> value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetItemsStateCopyWith<T, GetItemsState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetItemsStateCopyWith<T, $Res> {
  factory $GetItemsStateCopyWith(
    GetItemsState<T> value,
    $Res Function(GetItemsState<T>) then,
  ) = _$GetItemsStateCopyWithImpl<T, $Res, GetItemsState<T>>;
  @useResult
  $Res call({
    PaginatedResponse<T> response,
    String searchQuery,
    int offset,
    int limit,
    List<T> hiddenItems,
    List<T> shownItems,
  });
}

/// @nodoc
class _$GetItemsStateCopyWithImpl<T, $Res, $Val extends GetItemsState<T>>
    implements $GetItemsStateCopyWith<T, $Res> {
  _$GetItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? searchQuery = null,
    Object? offset = null,
    Object? limit = null,
    Object? hiddenItems = null,
    Object? shownItems = null,
  }) {
    return _then(
      _value.copyWith(
            response: null == response
                ? _value.response!
                : response // ignore: cast_nullable_to_non_nullable
                      as PaginatedResponse<T>,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            offset: null == offset
                ? _value.offset
                : offset // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            hiddenItems: null == hiddenItems
                ? _value.hiddenItems
                : hiddenItems // ignore: cast_nullable_to_non_nullable
                      as List<T>,
            shownItems: null == shownItems
                ? _value.shownItems
                : shownItems // ignore: cast_nullable_to_non_nullable
                      as List<T>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetItemsInitialImplCopyWith<T, $Res>
    implements $GetItemsStateCopyWith<T, $Res> {
  factory _$$GetItemsInitialImplCopyWith(
    _$GetItemsInitialImpl<T> value,
    $Res Function(_$GetItemsInitialImpl<T>) then,
  ) = __$$GetItemsInitialImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    PaginatedResponse<T>? response,
    String searchQuery,
    int offset,
    int limit,
    List<T> hiddenItems,
    List<T> shownItems,
  });
}

/// @nodoc
class __$$GetItemsInitialImplCopyWithImpl<T, $Res>
    extends _$GetItemsStateCopyWithImpl<T, $Res, _$GetItemsInitialImpl<T>>
    implements _$$GetItemsInitialImplCopyWith<T, $Res> {
  __$$GetItemsInitialImplCopyWithImpl(
    _$GetItemsInitialImpl<T> _value,
    $Res Function(_$GetItemsInitialImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? searchQuery = null,
    Object? offset = null,
    Object? limit = null,
    Object? hiddenItems = null,
    Object? shownItems = null,
  }) {
    return _then(
      _$GetItemsInitialImpl<T>(
        response: freezed == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                  as PaginatedResponse<T>?,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        hiddenItems: null == hiddenItems
            ? _value._hiddenItems
            : hiddenItems // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        shownItems: null == shownItems
            ? _value._shownItems
            : shownItems // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsInitialImpl<T> extends GetItemsInitial<T> {
  const _$GetItemsInitialImpl({
    this.response,
    this.searchQuery = '',
    this.offset = 0,
    this.limit = 10,
    required final List<T> hiddenItems,
    required final List<T> shownItems,
  }) : _hiddenItems = hiddenItems,
       _shownItems = shownItems,
       super._();

  @override
  final PaginatedResponse<T>? response;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final int offset;
  @override
  @JsonKey()
  final int limit;
  final List<T> _hiddenItems;
  @override
  List<T> get hiddenItems {
    if (_hiddenItems is EqualUnmodifiableListView) return _hiddenItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hiddenItems);
  }

  final List<T> _shownItems;
  @override
  List<T> get shownItems {
    if (_shownItems is EqualUnmodifiableListView) return _shownItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shownItems);
  }

  @override
  String toString() {
    return 'GetItemsState<$T>.initial(response: $response, searchQuery: $searchQuery, offset: $offset, limit: $limit, hiddenItems: $hiddenItems, shownItems: $shownItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsInitialImpl<T> &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(
              other._hiddenItems,
              _hiddenItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._shownItems,
              _shownItems,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    response,
    searchQuery,
    offset,
    limit,
    const DeepCollectionEquality().hash(_hiddenItems),
    const DeepCollectionEquality().hash(_shownItems),
  );

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsInitialImplCopyWith<T, _$GetItemsInitialImpl<T>> get copyWith =>
      __$$GetItemsInitialImplCopyWithImpl<T, _$GetItemsInitialImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    initial,
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    loading,
    required TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    success,
    required TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    failure,
  }) {
    return initial(
      response,
      searchQuery,
      offset,
      limit,
      hiddenItems,
      shownItems,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult? Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult? Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
  }) {
    return initial?.call(
      response,
      searchQuery,
      offset,
      limit,
      hiddenItems,
      shownItems,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
        response,
        searchQuery,
        offset,
        limit,
        hiddenItems,
        shownItems,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsInitial<T> value) initial,
    required TResult Function(GetItemsLoading<T> value) loading,
    required TResult Function(GetItemsSuccess<T> value) success,
    required TResult Function(GetItemsFailure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsInitial<T> value)? initial,
    TResult? Function(GetItemsLoading<T> value)? loading,
    TResult? Function(GetItemsSuccess<T> value)? success,
    TResult? Function(GetItemsFailure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsInitial<T> value)? initial,
    TResult Function(GetItemsLoading<T> value)? loading,
    TResult Function(GetItemsSuccess<T> value)? success,
    TResult Function(GetItemsFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GetItemsInitial<T> extends GetItemsState<T> {
  const factory GetItemsInitial({
    final PaginatedResponse<T>? response,
    final String searchQuery,
    final int offset,
    final int limit,
    required final List<T> hiddenItems,
    required final List<T> shownItems,
  }) = _$GetItemsInitialImpl<T>;
  const GetItemsInitial._() : super._();

  @override
  PaginatedResponse<T>? get response;
  @override
  String get searchQuery;
  @override
  int get offset;
  @override
  int get limit;
  @override
  List<T> get hiddenItems;
  @override
  List<T> get shownItems;

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsInitialImplCopyWith<T, _$GetItemsInitialImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsLoadingImplCopyWith<T, $Res>
    implements $GetItemsStateCopyWith<T, $Res> {
  factory _$$GetItemsLoadingImplCopyWith(
    _$GetItemsLoadingImpl<T> value,
    $Res Function(_$GetItemsLoadingImpl<T>) then,
  ) = __$$GetItemsLoadingImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    PaginatedResponse<T>? response,
    String searchQuery,
    int offset,
    int limit,
    List<T> hiddenItems,
    List<T> shownItems,
  });
}

/// @nodoc
class __$$GetItemsLoadingImplCopyWithImpl<T, $Res>
    extends _$GetItemsStateCopyWithImpl<T, $Res, _$GetItemsLoadingImpl<T>>
    implements _$$GetItemsLoadingImplCopyWith<T, $Res> {
  __$$GetItemsLoadingImplCopyWithImpl(
    _$GetItemsLoadingImpl<T> _value,
    $Res Function(_$GetItemsLoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? searchQuery = null,
    Object? offset = null,
    Object? limit = null,
    Object? hiddenItems = null,
    Object? shownItems = null,
  }) {
    return _then(
      _$GetItemsLoadingImpl<T>(
        response: freezed == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                  as PaginatedResponse<T>?,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        hiddenItems: null == hiddenItems
            ? _value._hiddenItems
            : hiddenItems // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        shownItems: null == shownItems
            ? _value._shownItems
            : shownItems // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsLoadingImpl<T> extends GetItemsLoading<T> {
  const _$GetItemsLoadingImpl({
    this.response,
    required this.searchQuery,
    required this.offset,
    required this.limit,
    required final List<T> hiddenItems,
    required final List<T> shownItems,
  }) : _hiddenItems = hiddenItems,
       _shownItems = shownItems,
       super._();

  @override
  final PaginatedResponse<T>? response;
  @override
  final String searchQuery;
  @override
  final int offset;
  @override
  final int limit;
  final List<T> _hiddenItems;
  @override
  List<T> get hiddenItems {
    if (_hiddenItems is EqualUnmodifiableListView) return _hiddenItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hiddenItems);
  }

  final List<T> _shownItems;
  @override
  List<T> get shownItems {
    if (_shownItems is EqualUnmodifiableListView) return _shownItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shownItems);
  }

  @override
  String toString() {
    return 'GetItemsState<$T>.loading(response: $response, searchQuery: $searchQuery, offset: $offset, limit: $limit, hiddenItems: $hiddenItems, shownItems: $shownItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsLoadingImpl<T> &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(
              other._hiddenItems,
              _hiddenItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._shownItems,
              _shownItems,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    response,
    searchQuery,
    offset,
    limit,
    const DeepCollectionEquality().hash(_hiddenItems),
    const DeepCollectionEquality().hash(_shownItems),
  );

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsLoadingImplCopyWith<T, _$GetItemsLoadingImpl<T>> get copyWith =>
      __$$GetItemsLoadingImplCopyWithImpl<T, _$GetItemsLoadingImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    initial,
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    loading,
    required TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    success,
    required TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    failure,
  }) {
    return loading(
      response,
      searchQuery,
      offset,
      limit,
      hiddenItems,
      shownItems,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult? Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult? Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
  }) {
    return loading?.call(
      response,
      searchQuery,
      offset,
      limit,
      hiddenItems,
      shownItems,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(
        response,
        searchQuery,
        offset,
        limit,
        hiddenItems,
        shownItems,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsInitial<T> value) initial,
    required TResult Function(GetItemsLoading<T> value) loading,
    required TResult Function(GetItemsSuccess<T> value) success,
    required TResult Function(GetItemsFailure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsInitial<T> value)? initial,
    TResult? Function(GetItemsLoading<T> value)? loading,
    TResult? Function(GetItemsSuccess<T> value)? success,
    TResult? Function(GetItemsFailure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsInitial<T> value)? initial,
    TResult Function(GetItemsLoading<T> value)? loading,
    TResult Function(GetItemsSuccess<T> value)? success,
    TResult Function(GetItemsFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetItemsLoading<T> extends GetItemsState<T> {
  const factory GetItemsLoading({
    final PaginatedResponse<T>? response,
    required final String searchQuery,
    required final int offset,
    required final int limit,
    required final List<T> hiddenItems,
    required final List<T> shownItems,
  }) = _$GetItemsLoadingImpl<T>;
  const GetItemsLoading._() : super._();

  @override
  PaginatedResponse<T>? get response;
  @override
  String get searchQuery;
  @override
  int get offset;
  @override
  int get limit;
  @override
  List<T> get hiddenItems;
  @override
  List<T> get shownItems;

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsLoadingImplCopyWith<T, _$GetItemsLoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsSuccessImplCopyWith<T, $Res>
    implements $GetItemsStateCopyWith<T, $Res> {
  factory _$$GetItemsSuccessImplCopyWith(
    _$GetItemsSuccessImpl<T> value,
    $Res Function(_$GetItemsSuccessImpl<T>) then,
  ) = __$$GetItemsSuccessImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    PaginatedResponse<T> response,
    String searchQuery,
    int offset,
    int limit,
    List<T> hiddenItems,
    List<T> shownItems,
  });
}

/// @nodoc
class __$$GetItemsSuccessImplCopyWithImpl<T, $Res>
    extends _$GetItemsStateCopyWithImpl<T, $Res, _$GetItemsSuccessImpl<T>>
    implements _$$GetItemsSuccessImplCopyWith<T, $Res> {
  __$$GetItemsSuccessImplCopyWithImpl(
    _$GetItemsSuccessImpl<T> _value,
    $Res Function(_$GetItemsSuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? searchQuery = null,
    Object? offset = null,
    Object? limit = null,
    Object? hiddenItems = null,
    Object? shownItems = null,
  }) {
    return _then(
      _$GetItemsSuccessImpl<T>(
        response: null == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                  as PaginatedResponse<T>,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        hiddenItems: null == hiddenItems
            ? _value._hiddenItems
            : hiddenItems // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        shownItems: null == shownItems
            ? _value._shownItems
            : shownItems // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// @nodoc

class _$GetItemsSuccessImpl<T> extends GetItemsSuccess<T> {
  const _$GetItemsSuccessImpl({
    required this.response,
    required this.searchQuery,
    required this.offset,
    required this.limit,
    required final List<T> hiddenItems,
    required final List<T> shownItems,
  }) : _hiddenItems = hiddenItems,
       _shownItems = shownItems,
       super._();

  @override
  final PaginatedResponse<T> response;
  @override
  final String searchQuery;
  @override
  final int offset;
  @override
  final int limit;
  final List<T> _hiddenItems;
  @override
  List<T> get hiddenItems {
    if (_hiddenItems is EqualUnmodifiableListView) return _hiddenItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hiddenItems);
  }

  final List<T> _shownItems;
  @override
  List<T> get shownItems {
    if (_shownItems is EqualUnmodifiableListView) return _shownItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shownItems);
  }

  @override
  String toString() {
    return 'GetItemsState<$T>.success(response: $response, searchQuery: $searchQuery, offset: $offset, limit: $limit, hiddenItems: $hiddenItems, shownItems: $shownItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsSuccessImpl<T> &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(
              other._hiddenItems,
              _hiddenItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._shownItems,
              _shownItems,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    response,
    searchQuery,
    offset,
    limit,
    const DeepCollectionEquality().hash(_hiddenItems),
    const DeepCollectionEquality().hash(_shownItems),
  );

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsSuccessImplCopyWith<T, _$GetItemsSuccessImpl<T>> get copyWith =>
      __$$GetItemsSuccessImplCopyWithImpl<T, _$GetItemsSuccessImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    initial,
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    loading,
    required TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    success,
    required TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    failure,
  }) {
    return success(
      response,
      searchQuery,
      offset,
      limit,
      hiddenItems,
      shownItems,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult? Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult? Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
  }) {
    return success?.call(
      response,
      searchQuery,
      offset,
      limit,
      hiddenItems,
      shownItems,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(
        response,
        searchQuery,
        offset,
        limit,
        hiddenItems,
        shownItems,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsInitial<T> value) initial,
    required TResult Function(GetItemsLoading<T> value) loading,
    required TResult Function(GetItemsSuccess<T> value) success,
    required TResult Function(GetItemsFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsInitial<T> value)? initial,
    TResult? Function(GetItemsLoading<T> value)? loading,
    TResult? Function(GetItemsSuccess<T> value)? success,
    TResult? Function(GetItemsFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsInitial<T> value)? initial,
    TResult Function(GetItemsLoading<T> value)? loading,
    TResult Function(GetItemsSuccess<T> value)? success,
    TResult Function(GetItemsFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetItemsSuccess<T> extends GetItemsState<T> {
  const factory GetItemsSuccess({
    required final PaginatedResponse<T> response,
    required final String searchQuery,
    required final int offset,
    required final int limit,
    required final List<T> hiddenItems,
    required final List<T> shownItems,
  }) = _$GetItemsSuccessImpl<T>;
  const GetItemsSuccess._() : super._();

  @override
  PaginatedResponse<T> get response;
  @override
  String get searchQuery;
  @override
  int get offset;
  @override
  int get limit;
  @override
  List<T> get hiddenItems;
  @override
  List<T> get shownItems;

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsSuccessImplCopyWith<T, _$GetItemsSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetItemsFailureImplCopyWith<T, $Res>
    implements $GetItemsStateCopyWith<T, $Res> {
  factory _$$GetItemsFailureImplCopyWith(
    _$GetItemsFailureImpl<T> value,
    $Res Function(_$GetItemsFailureImpl<T>) then,
  ) = __$$GetItemsFailureImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    AppError failure,
    PaginatedResponse<T>? response,
    String searchQuery,
    int offset,
    int limit,
    List<T> hiddenItems,
    List<T> shownItems,
  });

  $AppErrorCopyWith<$Res> get failure;
}

/// @nodoc
class __$$GetItemsFailureImplCopyWithImpl<T, $Res>
    extends _$GetItemsStateCopyWithImpl<T, $Res, _$GetItemsFailureImpl<T>>
    implements _$$GetItemsFailureImplCopyWith<T, $Res> {
  __$$GetItemsFailureImplCopyWithImpl(
    _$GetItemsFailureImpl<T> _value,
    $Res Function(_$GetItemsFailureImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? response = freezed,
    Object? searchQuery = null,
    Object? offset = null,
    Object? limit = null,
    Object? hiddenItems = null,
    Object? shownItems = null,
  }) {
    return _then(
      _$GetItemsFailureImpl<T>(
        failure: null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as AppError,
        response: freezed == response
            ? _value.response
            : response // ignore: cast_nullable_to_non_nullable
                  as PaginatedResponse<T>?,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        offset: null == offset
            ? _value.offset
            : offset // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        hiddenItems: null == hiddenItems
            ? _value._hiddenItems
            : hiddenItems // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        shownItems: null == shownItems
            ? _value._shownItems
            : shownItems // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res> get failure {
    return $AppErrorCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$GetItemsFailureImpl<T> extends GetItemsFailure<T> {
  const _$GetItemsFailureImpl({
    required this.failure,
    this.response,
    required this.searchQuery,
    required this.offset,
    required this.limit,
    required final List<T> hiddenItems,
    required final List<T> shownItems,
  }) : _hiddenItems = hiddenItems,
       _shownItems = shownItems,
       super._();

  @override
  final AppError failure;
  @override
  final PaginatedResponse<T>? response;
  @override
  final String searchQuery;
  @override
  final int offset;
  @override
  final int limit;
  final List<T> _hiddenItems;
  @override
  List<T> get hiddenItems {
    if (_hiddenItems is EqualUnmodifiableListView) return _hiddenItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hiddenItems);
  }

  final List<T> _shownItems;
  @override
  List<T> get shownItems {
    if (_shownItems is EqualUnmodifiableListView) return _shownItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shownItems);
  }

  @override
  String toString() {
    return 'GetItemsState<$T>.failure(failure: $failure, response: $response, searchQuery: $searchQuery, offset: $offset, limit: $limit, hiddenItems: $hiddenItems, shownItems: $shownItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemsFailureImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(
              other._hiddenItems,
              _hiddenItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._shownItems,
              _shownItems,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    failure,
    response,
    searchQuery,
    offset,
    limit,
    const DeepCollectionEquality().hash(_hiddenItems),
    const DeepCollectionEquality().hash(_shownItems),
  );

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetItemsFailureImplCopyWith<T, _$GetItemsFailureImpl<T>> get copyWith =>
      __$$GetItemsFailureImplCopyWithImpl<T, _$GetItemsFailureImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    initial,
    required TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    loading,
    required TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    success,
    required TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )
    failure,
  }) {
    return failure(
      this.failure,
      response,
      searchQuery,
      offset,
      limit,
      hiddenItems,
      shownItems,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult? Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult? Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult? Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
  }) {
    return failure?.call(
      this.failure,
      response,
      searchQuery,
      offset,
      limit,
      hiddenItems,
      shownItems,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    initial,
    TResult Function(
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    loading,
    TResult Function(
      PaginatedResponse<T> response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    success,
    TResult Function(
      AppError failure,
      PaginatedResponse<T>? response,
      String searchQuery,
      int offset,
      int limit,
      List<T> hiddenItems,
      List<T> shownItems,
    )?
    failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(
        this.failure,
        response,
        searchQuery,
        offset,
        limit,
        hiddenItems,
        shownItems,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetItemsInitial<T> value) initial,
    required TResult Function(GetItemsLoading<T> value) loading,
    required TResult Function(GetItemsSuccess<T> value) success,
    required TResult Function(GetItemsFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetItemsInitial<T> value)? initial,
    TResult? Function(GetItemsLoading<T> value)? loading,
    TResult? Function(GetItemsSuccess<T> value)? success,
    TResult? Function(GetItemsFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetItemsInitial<T> value)? initial,
    TResult Function(GetItemsLoading<T> value)? loading,
    TResult Function(GetItemsSuccess<T> value)? success,
    TResult Function(GetItemsFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class GetItemsFailure<T> extends GetItemsState<T> {
  const factory GetItemsFailure({
    required final AppError failure,
    final PaginatedResponse<T>? response,
    required final String searchQuery,
    required final int offset,
    required final int limit,
    required final List<T> hiddenItems,
    required final List<T> shownItems,
  }) = _$GetItemsFailureImpl<T>;
  const GetItemsFailure._() : super._();

  AppError get failure;
  @override
  PaginatedResponse<T>? get response;
  @override
  String get searchQuery;
  @override
  int get offset;
  @override
  int get limit;
  @override
  List<T> get hiddenItems;
  @override
  List<T> get shownItems;

  /// Create a copy of GetItemsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetItemsFailureImplCopyWith<T, _$GetItemsFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
