import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ShiftsRemoteDataSource extends BaseAppRepository {
  ShiftsRemoteDataSource({required super.api});

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
      final List<dynamic> shifts = responseData['shifts'] as List<dynamic>;
      final Map<String, dynamic> pagination = Map<String, dynamic>.from(
        responseData['pagination'] as Map,
      );

      final PaginatedResponse<Shift> paginatedResponse =
          PaginatedResponse<Shift>.fromJson(
            json: <String, dynamic>{
              'data': shifts,
              'total': pagination['totalCount'],
              'page': pagination['currentPage'],
              'end': !(pagination['hasNextPage'] as bool),
            },
            dataKey: 'data',
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

      final Shift shift = Shift.fromJson(
        Map<String, dynamic>.from(responseData['data'] as Map),
      );

      return right<AppError, Shift>(shift);
    });
  }
}
