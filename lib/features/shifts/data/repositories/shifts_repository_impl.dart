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
  Future<Either<AppError, Shift>> claimShift(String id) {
    return _remoteDataSource.claimShift(id);
  }

  @override
  Future<Either<AppError, PaginatedResponse<Shift>>> getMarketplaceShifts({
    required int page,
    required int limit,
    String? role,
    DateTime? date,
    String? typeOfShift,
    ShiftSortOrder? sortOrder,
  }) {
    return _remoteDataSource.getMarketplaceShifts(
      page: page,
      limit: limit,
      role: role,
      date: date,
      typeOfShift: typeOfShift,
      sortOrder: sortOrder,
    );
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

  @override
  Future<Either<AppError, LocationVerificationResult>> verifyLocation({
    required String id,
    required double latitude,
    required double longitude,
  }) {
    return _remoteDataSource.verifyLocation(
      id: id,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
