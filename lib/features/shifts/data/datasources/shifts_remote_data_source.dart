import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ShiftsRemoteDataSource extends BaseAppRepository {
  ShiftsRemoteDataSource({required super.api});

  Future<Either<AppError, Unit>> cancelShift(String id) {
    return makeRequest(() async {
      await patch(Endpoints.cancelShift(id));

      return right<AppError, Unit>(unit);
    });
  }

  Future<Either<AppError, Unit>> clockIn(String id) {
    return makeRequest(() async {
      await patch(Endpoints.clockInShift(id));

      return right<AppError, Unit>(unit);
    });
  }

  Future<Either<AppError, Unit>> clockOut(String id) {
    return makeRequest(() async {
      await patch(Endpoints.clockOutShift(id));

      return right<AppError, Unit>(unit);
    });
  }

  Future<Either<AppError, PaginatedResponse<Shift>>> getMyShifts({
    required int page,
    required int limit,
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  }) {
    return makeRequest(() async {
      final response = await get(
        Endpoints.myShifts,
        queryParameters: <String, dynamic>{
          'page': page,
          'limit': limit,
          if (status != null) 'status': status.value,
          if (sortBy != null) 'sortBy': sortBy.value,
          if (sortOrder != null) 'sortOrder': sortOrder.value,
        },
      );

      final Map<String, dynamic> responseData = Map<String, dynamic>.from(
        response.data as Map,
      );
      final PaginatedResponse<Shift> paginatedResponse =
          PaginatedResponse<Shift>.fromJson(
            json: responseData,
            dataKey: 'shifts',
            fromJson: (dynamic json) =>
                Shift.fromJson(Map<String, dynamic>.from(json as Map)),
          );

      return right<AppError, PaginatedResponse<Shift>>(paginatedResponse);
    });
  }

  Future<Either<AppError, Shift>> getShiftDetail(String id) {
    return makeRequest(() async {
      final response = await get(Endpoints.shiftDetail(id));
      final Map<String, dynamic> responseData = Map<String, dynamic>.from(
        response.data as Map,
      );

      final Object? shiftData = responseData['shift'] ?? responseData['data'];
      final Shift shift = Shift.fromJson(
        Map<String, dynamic>.from(shiftData as Map),
      );

      return right<AppError, Shift>(shift);
    });
  }
}
