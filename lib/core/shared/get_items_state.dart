part of 'get_items_bloc.dart';

@freezed
abstract class GetItemsState<T> with _$GetItemsState<T> {
  const GetItemsState._();
  const factory GetItemsState.initial({
    PaginatedResponse<T>? response,
    @Default('') String searchQuery,
    @Default(0) int offset,
    @Default(10) int limit,
    required List<T> hiddenItems,
    required List<T> shownItems,
  }) = GetItemsInitial<T>;

  const factory GetItemsState.loading({
    PaginatedResponse<T>? response,
    required String searchQuery,
    required int offset,
    required int limit,
    required List<T> hiddenItems,
    required List<T> shownItems,
  }) = GetItemsLoading<T>;

  const factory GetItemsState.success({
    required PaginatedResponse<T> response,
    required String searchQuery,
    required int offset,
    required int limit,
    required List<T> hiddenItems,
    required List<T> shownItems,
  }) = GetItemsSuccess<T>;

  const factory GetItemsState.failure({
    required AppError failure,
    PaginatedResponse<T>? response,
    required String searchQuery,
    required int offset,
    required int limit,
    required List<T> hiddenItems,
    required List<T> shownItems,
  }) = GetItemsFailure<T>;

  bool get responseIsEmpty =>
      response != null && response!.data.isEmpty && offset == 0;

  bool get hasItems => response != null && response!.data.isNotEmpty;

  bool get isLoadingMore => offset > 0 && this is GetItemsLoading<T>;

  bool get isLoading =>
      this is GetItemsLoading<T> &&
      offset == 0 &&
      (response == null || responseIsEmpty);

  bool get isInitial => this is GetItemsInitial<T>;

  bool get canLoadMore => response?.hasNextPage ?? false;

  int get nextOffset => (response?.currentPage ?? offset) + 1;

  AppError? get failure =>
      mapOrNull(failure: (GetItemsFailure<T> state) => state.failure);

  bool get isEmptyState {
    return maybeMap(
      orElse: () => false,
      success: (GetItemsSuccess<T> state) => responseIsEmpty,
    );
  }

  bool get isRefreshingEmptyState {
    return maybeMap(
      orElse: () => false,
      loading: (GetItemsLoading<T> state) => responseIsEmpty,
    );
  }

  bool get isRefreshing {
    return maybeMap(
      orElse: () => false,
      loading: (GetItemsLoading<T> state) => !responseIsEmpty,
    );
  }

  bool get hasFailure {
    return maybeMap(
      orElse: () => false,
      failure: (GetItemsFailure<T> state) => true,
    );
  }
}
