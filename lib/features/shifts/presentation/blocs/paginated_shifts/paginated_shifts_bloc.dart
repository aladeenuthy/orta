import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class PaginatedShiftsBloc extends GetItemsBloc<Shift, ShiftFilters> {
  PaginatedShiftsBloc({
    required ShiftsService shiftsService,
    required ShiftFilters filters,
    int limit = 10,
  }) : _shiftsService = shiftsService,
       _filters = filters,
       _limit = limit;

  final ShiftsService _shiftsService;
  final ShiftFilters _filters;
  final int _limit;

  Future<bool> fetchInitial({bool bypassCache = true}) {
    return getItems(
      offset: 1,
      limit: _limit,
      optionalData: _filters,
      bypassCache: bypassCache,
    );
  }

  Future<bool> refresh({bool bypassCache = true}) {
    return fetchInitial(bypassCache: bypassCache);
  }

  Future<bool> loadMoreShifts({bool bypassCache = true}) {
    return loadMore(optionalData: _filters, bypassCache: bypassCache);
  }

  @override
  bool itemEquals(Shift item1, Shift item2) {
    if (item1.id != null && item2.id != null) {
      return item1.id == item2.id;
    }

    return item1 == item2;
  }

  @override
  Future<Either<AppError, PaginatedResponse<Shift>>> makeRequest({
    required String searchQuery,
    int offset = 1,
    int limit = 10,
    ShiftFilters? optionalData,
    bool bypassCache = true,
  }) {
    final ShiftFilters filters = optionalData ?? _filters;

    return _shiftsService.getMyShifts(
      page: offset,
      limit: limit,
      status: filters.status,
      sortBy: filters.sortBy,
      sortOrder: filters.sortOrder,
    );
  }
}
