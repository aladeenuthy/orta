import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

abstract class ShiftsRepository {
  Future<Either<AppError, PaginatedResponse<Shift>>> getMyShifts({
    required int page,
    required int limit,
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  });

  Future<Either<AppError, Shift>> getShiftDetail(String id);
}
