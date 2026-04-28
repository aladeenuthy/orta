import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class MarketplaceShiftsBloc extends GetItemsBloc<Shift, ShiftFilters> {
  MarketplaceShiftsBloc({required ShiftsService shiftsService})
    : _shiftsService = shiftsService;

  final ShiftsService _shiftsService;

  Future<bool> fetchInitial({
    ShiftFilters filters = const ShiftFilters(),
    String searchQuery = '',
    bool bypassCache = true,
  }) {
    return getItems(
      offset: 1,
      limit: 10,
      searchQuery: searchQuery,
      optionalData: filters,
      bypassCache: bypassCache,
    );
  }

  Future<bool> refresh({
    ShiftFilters filters = const ShiftFilters(),
    String searchQuery = '',
  }) {
    return fetchInitial(filters: filters, searchQuery: searchQuery);
  }

  Future<bool> loadMoreShifts({ShiftFilters filters = const ShiftFilters()}) {
    return loadMore(optionalData: filters);
  }

  @override
  bool itemEquals(Shift item1, Shift item2) => item1.id == item2.id;

  @override
  Future<Either<AppError, PaginatedResponse<Shift>>> makeRequest({
    required String searchQuery,
    int offset = 1,
    int limit = 10,
    ShiftFilters? optionalData,
    bool bypassCache = true,
  }) {
    final ShiftFilters filters = optionalData ?? const ShiftFilters();

    return _shiftsService.getMarketplaceShifts(
      page: offset,
      limit: limit,
      role: filters.role,
      date: filters.date,
      typeOfShift: filters.typeOfShift,
      sortOrder: filters.sortOrder,
    );
  }
}
