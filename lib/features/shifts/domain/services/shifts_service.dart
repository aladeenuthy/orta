import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ShiftsService {
  ShiftsService({required ShiftsRepository repository})
    : _repository = repository;

  final ShiftsRepository _repository;

  Future<Either<AppError, Unit>> cancelShift(String id) {
    return _repository.cancelShift(id);
  }

  Future<Either<AppError, Unit>> clockIn(String id) {
    return _repository.clockIn(id);
  }

  Future<Either<AppError, Unit>> clockOut(String id) {
    return _repository.clockOut(id);
  }

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
