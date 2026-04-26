import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ShiftsService {
  ShiftsService({required ShiftsRepository repository})
    : _repository = repository;

  final ShiftsRepository _repository;

  Future<Either<AppError, PaginatedResponse<Shift>>> getMyShifts({
    required int page,
    required int limit,
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  }) {
    return _repository.getMyShifts(
      page: page,
      limit: limit,
      status: status,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  Future<Either<AppError, Shift>> getShiftDetail(String id) {
    return _repository.getShiftDetail(id);
  }
}
