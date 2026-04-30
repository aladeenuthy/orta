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

  Future<Either<AppError, Shift>> claimShift(String id) {
    return _repository.claimShift(id);
  }

  Future<Either<AppError, PaginatedResponse<Shift>>> getMarketplaceShifts({
    required int page,
    required int limit,
    String? role,
    DateTime? date,
    String? typeOfShift,
    ShiftSortOrder? sortOrder,
  }) {
    return _repository.getMarketplaceShifts(
      page: page,
      limit: limit,
      role: role,
      date: date,
      typeOfShift: typeOfShift,
      sortOrder: sortOrder,
    );
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

  Future<Either<AppError, LocationVerificationResult>> verifyLocation({
    required String id,
    required double latitude,
    required double longitude,
  }) {
    return _repository.verifyLocation(
      id: id,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
