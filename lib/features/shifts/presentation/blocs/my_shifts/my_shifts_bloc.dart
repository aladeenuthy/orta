import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class MyShiftsBloc extends GetItemsBloc<Shift, ShiftFilters> {
  MyShiftsBloc({required ShiftsService shiftsService})
    : _shiftsService = shiftsService,
      _filters = const ShiftFilters();

  final ShiftsService _shiftsService;
  ShiftFilters _filters;

  Future<bool> getMyShifts({
    required int page,
    required int limit,
    bool bypassCache = true,
  }) {
    return getItems(
      offset: page,
      limit: limit,
      optionalData: _filters,
      bypassCache: bypassCache,
    );
  }

  Future<bool> filterShifts({
    required int page,
    required int limit,
    required ShiftFilters filters,
    bool bypassCache = true,
  }) {
    _filters = filters;
    return getMyShifts(page: page, limit: limit, bypassCache: bypassCache);
  }

  Future<bool> loadMoreShifts({bool bypassCache = true}) {
    return loadMore(optionalData: _filters, bypassCache: bypassCache);
  }

  @override
  bool itemEquals(Shift item1, Shift item2) {
    if (item1.id != null && item2.id != null) return item1.id == item2.id;
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
    final ShiftFilters filters = optionalData ?? const ShiftFilters();

    return _shiftsService.getMyShifts(
      page: offset,
      limit: limit,
      status: filters.status,
      sortBy: filters.sortBy,
      sortOrder: filters.sortOrder,
    );
  }
}
