import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../app/app_error.dart';
import '../network/paginated_response.dart';

part 'get_items_bloc.freezed.dart';
part 'get_items_event.dart';
part 'get_items_state.dart';

abstract class GetItemsBloc<T, D>
    extends Bloc<GetItemsEvent<T, D>, GetItemsState<T>> {
  GetItemsBloc({GetItemsState<T>? initialState})
    : super(
        initialState ??
            GetItemsInitial<T>(hiddenItems: <T>[], shownItems: <T>[]),
      ) {
    on<GetItemsGetEvent<T, D>>(_onGetItems);
    on<GetItemsLoadMoreEvent<T, D>>(_onLoadMore);
    on<GetItemsUpdateItemEvent<T, D>>(_onUpdateItemEvent);
    on<GetItemsRemoveItemEvent<T, D>>(_onRemoveItemEvent);
    on<GetItemsRemoveItemsEvent<T, D>>(_onRemoveItemsEvent);
    on<GetItemsAddItemEvent<T, D>>(_onAddItemEvent);
    on<GetItemsAddItemsEvent<T, D>>(_onAddItemsEvent);
    on<GetItemsResetEvent<T, D>>(_onResetEvent);
    on<GetItemsUpdateHiddenItemsEvent<T, D>>(_onUpdateHiddenItemsEvent);
    on<GetItemsUpdateShownItemsEvent<T, D>>(_onUpdateShownItemsEvent);
  }

  StreamSubscription<bool>? connectivitySubscription;

  Future<bool> getItems({
    int offset = 0,
    int limit = 10,
    String searchQuery = '',
    D? optionalData,
    bool bypassCache = true,
  }) async {
    if (_shouldSkipGetItems(
      offset: offset,
      searchQuery: searchQuery,
      bypassCache: bypassCache,
    )) {
      return true;
    }

    add(
      GetItemsGetEvent<T, D>(
        offset: offset,
        limit: limit,
        searchQuery: searchQuery,
        optionalData: optionalData,
        bypassCache: bypassCache,
      ),
    );
    return _getCompletesState();
  }

  Future<bool> loadMore({D? optionalData, bool bypassCache = true}) async {
    add(
      GetItemsLoadMoreEvent<T, D>(
        optionalData: optionalData,
        bypassCache: bypassCache,
      ),
    );
    return _getCompletesState(isLoadMore: true);
  }

  void removeItem(T item) => add(GetItemsRemoveItemEvent<T, D>(item: item));

  void removeItems(List<T> items) =>
      add(GetItemsRemoveItemsEvent<T, D>(items: items));

  void addItem(T item) => add(GetItemsAddItemEvent<T, D>(item: item));

  void addItems(List<T> items) =>
      add(GetItemsAddItemsEvent<T, D>(items: items));

  void updateItem(T item) => add(GetItemsUpdateItemEvent<T, D>(item: item));

  void updateHiddenItems(List<T> items) =>
      add(GetItemsUpdateHiddenItemsEvent<T, D>(items: items));

  void updateShownItems(List<T> items) =>
      add(GetItemsUpdateShownItemsEvent<T, D>(items: items));

  List<T> getResolvedItem() {
    List<T> items = state.response?.data ?? <T>[];
    items = <T>[...state.shownItems, ...items];
    items.removeWhere(
      (T item) =>
          state.hiddenItems.any((T hiddenItem) => itemEquals(item, hiddenItem)),
    );
    return items;
  }

  void reset() => add(GetItemsResetEvent<T, D>());

  void _onResetEvent(
    GetItemsResetEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) {
    emit(GetItemsInitial<T>(hiddenItems: <T>[], shownItems: <T>[]));
  }

  void _onUpdateItemEvent(
    GetItemsUpdateItemEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) {
    if (state.response != null) {
      emit(
        state.copyWith(
          response: _copyResponseWithData(
            state.response!,
            state.response!.data.map((T item) {
              if (itemEquals(item, event.item)) {
                return event.item;
              }
              return item;
            }).toList(),
          ),
        ),
      );
    }
  }

  void _onRemoveItemEvent(
    GetItemsRemoveItemEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) {
    if (state.response != null) {
      emit(
        state.copyWith(
          response: _copyResponseWithData(
            state.response!,
            state.response!.data.where((T item) {
              return !itemEquals(item, event.item);
            }).toList(),
          ),
        ),
      );
    }
  }

  void _onRemoveItemsEvent(
    GetItemsRemoveItemsEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) {
    if (state.response != null) {
      emit(
        state.copyWith(
          response: _copyResponseWithData(
            state.response!,
            state.response!.data.where((T item) {
              return !event.items.any(
                (T hiddenItem) => itemEquals(item, hiddenItem),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  void _onAddItemEvent(
    GetItemsAddItemEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) {
    if (state.response != null) {
      emit(
        state.copyWith(
          response: _copyResponseWithData(state.response!, <T>[
            event.item,
            ...state.response!.data,
          ]),
        ),
      );
    }
  }

  void _onAddItemsEvent(
    GetItemsAddItemsEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) {
    if (state.response != null) {
      emit(
        state.copyWith(
          response: _copyResponseWithData(state.response!, <T>[
            ...event.items,
            ...state.response!.data,
          ]),
        ),
      );
    }
  }

  Future<void> _onGetItems(
    GetItemsGetEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) async {
    // If the search query is the same as the previous one, don't do anything
    if (_shouldSkipGetItems(
      offset: event.offset,
      searchQuery: event.searchQuery,
      bypassCache: event.bypassCache,
    )) {
      return;
    }
    emit(
      GetItemsLoading<T>(
        response: state.response,
        searchQuery: event.searchQuery,
        offset: event.offset,
        limit: event.limit,
        hiddenItems: state.hiddenItems,
        shownItems: state.shownItems,
      ),
    );

    final Either<AppError, PaginatedResponse<T>> response = await makeRequest(
      searchQuery: event.searchQuery,
      offset: event.offset,
      limit: event.limit,
      optionalData: event.optionalData,
      bypassCache: event.bypassCache,
    );

    await response.fold(
      (AppError failure) async {
        await Future<void>.delayed(const Duration(milliseconds: 300));

        emit(
          GetItemsFailure<T>(
            failure: failure,
            searchQuery: event.searchQuery,
            response: state.response,
            offset: state.response?.currentPage ?? 0,
            limit: state.response?.limit ?? 10,
            hiddenItems: state.hiddenItems,
            shownItems: state.shownItems,
          ),
        );
      },
      (PaginatedResponse<T> response) {
        emit(
          GetItemsSuccess<T>(
            response: response,
            searchQuery: event.searchQuery,
            offset: response.currentPage,
            limit: response.limit,
            hiddenItems: state.hiddenItems,
            shownItems: state.shownItems,
          ),
        );
      },
    );
  }

  //ignore: long-method
  Future<void> _onLoadMore(
    GetItemsLoadMoreEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) async {
    if (!(state.response?.hasNextPage ?? false) ||
        state.isRefreshing ||
        state.isRefreshingEmptyState) {
      return;
    }
    emit(
      GetItemsLoading<T>(
        response: state.response,
        searchQuery: state.searchQuery,
        offset: state.nextOffset,
        limit: state.response!.limit,
        hiddenItems: state.hiddenItems,
        shownItems: state.shownItems,
      ),
    );

    final Either<AppError, PaginatedResponse<T>> response = await makeRequest(
      searchQuery: state.searchQuery,
      offset: state.nextOffset,
      limit: state.response!.limit,
      optionalData: event.optionalData,
      bypassCache: event.bypassCache,
    );

    response.fold(
      (AppError failure) {
        emit(
          GetItemsFailure<T>(
            failure: failure,
            response: state.response,
            searchQuery: state.searchQuery,
            offset: state.response?.currentPage ?? 0,
            limit: state.response?.limit ?? 10,
            hiddenItems: state.hiddenItems,
            shownItems: state.shownItems,
          ),
        );
      },
      (PaginatedResponse<T> response) {
        emit(
          GetItemsSuccess<T>(
            response: _copyResponseWithData(response, <T>[
              ...state.response!.data,
              ...response.data,
            ]),
            searchQuery: state.searchQuery,
            offset: response.currentPage,
            limit: response.limit,
            hiddenItems: state.hiddenItems,
            shownItems: state.shownItems,
          ),
        );
      },
    );
  }

  void _onUpdateHiddenItemsEvent(
    GetItemsUpdateHiddenItemsEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) {
    emit(state.copyWith(hiddenItems: event.items));
  }

  void _onUpdateShownItemsEvent(
    GetItemsUpdateShownItemsEvent<T, D> event,
    Emitter<GetItemsState<T>> emit,
  ) {
    emit(state.copyWith(shownItems: event.items));
  }

  Future<bool> _getCompletesState({bool isLoadMore = false}) {
    if (state.offset != 0) {
      if (!(state.response?.hasNextPage ?? true) &&
          (!state.isRefreshingEmptyState)) {
        return Future<bool>.value(true);
      }
    }
    if (!(state.response?.hasNextPage ?? true) &&
        (!state.isRefreshing) &&
        isLoadMore) {
      return Future<bool>.value(true);
    }
    // Completer to manage the asynchronous response
    final Completer<bool> completer = Completer<bool>();

    // Subscription to listen to the Bloc's state changes
    final StreamSubscription<GetItemsState<T>> subscription = stream.listen((
      GetItemsState<T> state,
    ) {
      if (state is GetItemsSuccess<T>) {
        // If success state is emitted, complete with true
        completer.complete(true);
      } else if (state is GetItemsFailure<T>) {
        // If failure state is emitted, complete with false
        completer.complete(false);
      }
    });
    // Wait for the completer to complete, then cancel the subscription
    return completer.future.whenComplete(subscription.cancel);
  }

  Future<Either<AppError, PaginatedResponse<T>>> makeRequest({
    required String searchQuery,
    int offset = 0,
    int limit = 10,
    D? optionalData,
    bool bypassCache = true,
  });

  @override
  Future<void> close() async {
    await connectivitySubscription?.cancel();
    connectivitySubscription = null;
    return super.close();
  }

  bool itemEquals(T item1, T item2);

  bool _shouldSkipGetItems({
    required int offset,
    required String searchQuery,
    required bool bypassCache,
  }) {
    return searchQuery.trim().toLowerCase() ==
            state.searchQuery.trim().toLowerCase() &&
        searchQuery.trim().isNotEmpty &&
        offset == state.offset &&
        !bypassCache;
  }

  PaginatedResponse<T> _copyResponseWithData(
    PaginatedResponse<T> response,
    List<T> data,
  ) {
    return PaginatedResponse<T>(
      data: data,
      currentPage: response.currentPage,
      totalPages: response.totalPages,
      totalCount: response.totalCount,
      hasNextPage: response.hasNextPage,
      hasPrevPage: response.hasPrevPage,
      limit: response.limit,
    );
  }
}

typedef GetItemsCubit<T, D> = GetItemsBloc<T, D>;
