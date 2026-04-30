part of 'get_items_bloc.dart';

@freezed
abstract class GetItemsEvent<T, D> with _$GetItemsEvent<T, D> {
  const factory GetItemsEvent.loadMore({
    required bool bypassCache,
    D? optionalData,
  }) = GetItemsLoadMoreEvent<T, D>;

  const factory GetItemsEvent.get({
    @Default('') String searchQuery,
    @Default(0) int offset,
    @Default(10) int limit,
    required bool bypassCache,
    D? optionalData,
  }) = GetItemsGetEvent<T, D>;

  const factory GetItemsEvent.updateItem({required T item}) =
      GetItemsUpdateItemEvent<T, D>;

  const factory GetItemsEvent.removeItem({required T item}) =
      GetItemsRemoveItemEvent<T, D>;

  const factory GetItemsEvent.removeItems({required List<T> items}) =
      GetItemsRemoveItemsEvent<T, D>;

  const factory GetItemsEvent.addItem({required T item}) =
      GetItemsAddItemEvent<T, D>;

  const factory GetItemsEvent.addItems({required List<T> items}) =
      GetItemsAddItemsEvent<T, D>;

  const factory GetItemsEvent.reset() = GetItemsResetEvent<T, D>;

  const factory GetItemsEvent.updateHiddenItems({required List<T> items}) =
      GetItemsUpdateHiddenItemsEvent<T, D>;

  const factory GetItemsEvent.updateShownItems({required List<T> items}) =
      GetItemsUpdateShownItemsEvent<T, D>;
}
