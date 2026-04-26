import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ShiftsRepositoryImpl implements ShiftsRepository {
  ShiftsRepositoryImpl({required ShiftsRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final ShiftsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<AppError, Unit>> cancelShift(String id) {
    return _remoteDataSource.cancelShift(id);
  }

  @override
  Future<Either<AppError, Unit>> clockIn(String id) {
    return _remoteDataSource.clockIn(id);
  }

  @override
  Future<Either<AppError, Unit>> clockOut(String id) {
    return _remoteDataSource.clockOut(id);
  }

  @override
  Future<Either<AppError, PaginatedResponse<Shift>>> getMyShifts({
    required int page,
    required int limit,
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  }) {
    return _remoteDataSource.getMyShifts(
      page: page,
      limit: limit,
      status: status,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  @override
  Future<Either<AppError, Shift>> getShiftDetail(String id) {
    return _remoteDataSource.getShiftDetail(id);
  }
}
