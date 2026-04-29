import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

import '../../shift_test_helpers.dart';

class MockApi extends Mock implements Api {}

void main() {
  late MockApi api;
  late ShiftsRemoteDataSource dataSource;

  setUp(() {
    api = MockApi();
    dataSource = ShiftsRemoteDataSource(api: api);
  });

  group('ShiftsRemoteDataSource.cancelShift', () {
    test('patches cancel shift endpoint', () async {
      when(() => api.patch(Endpoints.cancelShift('shift-id'))).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(
            path: Endpoints.cancelShift('shift-id'),
          ),
          data: <String, dynamic>{'success': true},
        ),
      );

      final Either<AppError, Unit> result = await dataSource.cancelShift(
        'shift-id',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => api.patch(Endpoints.cancelShift('shift-id'))).called(1);
    });

    test('returns AppError when the API request fails', () async {
      when(() => api.patch(Endpoints.cancelShift('shift-id'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(
            path: Endpoints.cancelShift('shift-id'),
          ),
          message: 'Server error',
        ),
      );

      final Either<AppError, Unit> result = await dataSource.cancelShift(
        'shift-id',
      );

      expect(result.isLeft(), isTrue);
    });
  });

  group('ShiftsRemoteDataSource.clockIn', () {
    test('patches clock-in endpoint', () async {
      when(() => api.patch(Endpoints.clockInShift('shift-id'))).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(
            path: Endpoints.clockInShift('shift-id'),
          ),
          data: <String, dynamic>{'success': true},
        ),
      );

      final Either<AppError, Unit> result = await dataSource.clockIn(
        'shift-id',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => api.patch(Endpoints.clockInShift('shift-id'))).called(1);
    });

    test('returns AppError when the API request fails', () async {
      when(() => api.patch(Endpoints.clockInShift('shift-id'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(
            path: Endpoints.clockInShift('shift-id'),
          ),
          message: 'Server error',
        ),
      );

      final Either<AppError, Unit> result = await dataSource.clockIn(
        'shift-id',
      );

      expect(result.isLeft(), isTrue);
    });
  });

  group('ShiftsRemoteDataSource.clockOut', () {
    test('patches clock-out endpoint', () async {
      when(() => api.patch(Endpoints.clockOutShift('shift-id'))).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(
            path: Endpoints.clockOutShift('shift-id'),
          ),
          data: <String, dynamic>{'success': true},
        ),
      );

      final Either<AppError, Unit> result = await dataSource.clockOut(
        'shift-id',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => api.patch(Endpoints.clockOutShift('shift-id'))).called(1);
    });

    test('returns AppError when the API request fails', () async {
      when(() => api.patch(Endpoints.clockOutShift('shift-id'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(
            path: Endpoints.clockOutShift('shift-id'),
          ),
          message: 'Server error',
        ),
      );

      final Either<AppError, Unit> result = await dataSource.clockOut(
        'shift-id',
      );

      expect(result.isLeft(), isTrue);
    });
  });

  group('ShiftsRemoteDataSource.getMyShifts', () {
    test('gets paginated shifts with query parameters', () async {
      when(
        () => api.get(
          Endpoints.myShifts,
          queryParameters: <String, dynamic>{
            'page': 2,
            'limit': 5,
            'status': 'In Progress',
            'sortBy': 'date',
            'sortOrder': 'desc',
          },
        ),
      ).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(path: Endpoints.myShifts),
          data: paginatedShiftsJson(
            shifts: <Map<String, dynamic>>[shiftJson()],
            currentPage: 2,
            totalPages: 3,
            totalCount: 11,
            hasNextPage: true,
            hasPrevPage: true,
            limit: 5,
          ),
        ),
      );

      final Either<AppError, PaginatedResponse<Shift>> result = await dataSource
          .getMyShifts(
            page: 2,
            limit: 5,
            status: ShiftStatusFilter.active,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.desc,
          );

      verify(
        () => api.get(
          Endpoints.myShifts,
          queryParameters: <String, dynamic>{
            'page': 2,
            'limit': 5,
            'status': 'In Progress',
            'sortBy': 'date',
            'sortOrder': 'desc',
          },
        ),
      ).called(1);
      result.fold(
        (AppError error) => fail('Expected paginated shifts, got $error'),
        (PaginatedResponse<Shift> response) {
          expect(response.data, hasLength(1));
          expect(response.data.first.title, 'Morning Care');
          expect(response.totalCount, 11);
          expect(response.currentPage, 2);
          expect(response.totalPages, 3);
          expect(response.hasNextPage, isTrue);
          expect(response.hasPrevPage, isTrue);
          expect(response.limit, 5);
        },
      );
    });

    test(
      'omits optional query parameters when filters are not provided',
      () async {
        when(
          () => api.get(
            Endpoints.myShifts,
            queryParameters: <String, dynamic>{'page': 1, 'limit': 10},
          ),
        ).thenAnswer(
          (_) async => Response<dynamic>(
            requestOptions: RequestOptions(path: Endpoints.myShifts),
            data: paginatedShiftsJson(shifts: <Map<String, dynamic>>[]),
          ),
        );

        final Either<AppError, PaginatedResponse<Shift>> result =
            await dataSource.getMyShifts(page: 1, limit: 10);

        expect(result.isRight(), isTrue);
        verify(
          () => api.get(
            Endpoints.myShifts,
            queryParameters: <String, dynamic>{'page': 1, 'limit': 10},
          ),
        ).called(1);
      },
    );

    test('returns AppError when the API request fails', () async {
      when(
        () => api.get(
          Endpoints.myShifts,
          queryParameters: <String, dynamic>{'page': 1, 'limit': 10},
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.myShifts),
          message: 'Server error',
        ),
      );

      final Either<AppError, PaginatedResponse<Shift>> result = await dataSource
          .getMyShifts(page: 1, limit: 10);

      expect(result.isLeft(), isTrue);
    });
  });

  group('ShiftsRemoteDataSource.getMarketplaceShifts', () {
    test('gets marketplace shifts with filters', () async {
      when(
        () => api.get(
          Endpoints.shiftMarketplace,
          queryParameters: <String, dynamic>{
            'page': 1,
            'limit': 10,
            'role': 'Care Worker',
            'date': '2026-04-26',
            'typeOfShift': 'Morning',
          },
        ),
      ).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(path: Endpoints.shiftMarketplace),
          data: <String, dynamic>{
            'success': true,
            'data': paginatedShiftsJson(
              shifts: <Map<String, dynamic>>[shiftJson()],
            ),
          },
        ),
      );

      final Either<AppError, PaginatedResponse<Shift>> result = await dataSource
          .getMarketplaceShifts(
            page: 1,
            limit: 10,
            role: 'Care Worker',
            date: DateTime(2026, 4, 26),
            typeOfShift: 'Morning',
            sortOrder: ShiftSortOrder.desc,
          );

      verify(
        () => api.get(
          Endpoints.shiftMarketplace,
          queryParameters: <String, dynamic>{
            'page': 1,
            'limit': 10,
            'role': 'Care Worker',
            'date': '2026-04-26',
            'typeOfShift': 'Morning',
          },
        ),
      ).called(1);
      result.fold(
        (AppError error) => fail('Expected marketplace shifts, got $error'),
        (PaginatedResponse<Shift> response) {
          expect(response.data, hasLength(1));
          expect(response.data.first.id, 'shift-id');
        },
      );
    });
  });

  group('ShiftsRemoteDataSource.claimShift', () {
    test('patches claim endpoint and parses returned shift', () async {
      when(() => api.patch(Endpoints.claimShift('shift-id'))).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(
            path: Endpoints.claimShift('shift-id'),
          ),
          data: <String, dynamic>{
            'success': true,
            'data': <String, dynamic>{'shift': shiftJson()},
          },
        ),
      );

      final Either<AppError, Shift> result = await dataSource.claimShift(
        'shift-id',
      );

      verify(() => api.patch(Endpoints.claimShift('shift-id'))).called(1);
      result.fold(
        (AppError error) => fail('Expected claimed shift, got $error'),
        (Shift shift) => expect(shift.id, 'shift-id'),
      );
    });
  });

  group('ShiftsRemoteDataSource.verifyLocation', () {
    test('posts coordinates and parses verification result', () async {
      when(
        () => api.post(
          Endpoints.verifyShiftLocation('shift-id'),
          data: <String, dynamic>{'latitude': 51.5074, 'longitude': -0.1276},
        ),
      ).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(
            path: Endpoints.verifyShiftLocation('shift-id'),
          ),
          data: <String, dynamic>{
            'success': true,
            'data': <String, dynamic>{
              'withinRange': true,
              'distanceMeters': 45,
              'radiusMeters': 200,
            },
          },
        ),
      );

      final Either<AppError, LocationVerificationResult> result =
          await dataSource.verifyLocation(
            id: 'shift-id',
            latitude: 51.5074,
            longitude: -0.1276,
          );

      verify(
        () => api.post(
          Endpoints.verifyShiftLocation('shift-id'),
          data: <String, dynamic>{'latitude': 51.5074, 'longitude': -0.1276},
        ),
      ).called(1);
      result.fold(
        (AppError error) => fail('Expected verification, got $error'),
        (LocationVerificationResult result) {
          expect(result.withinRange, isTrue);
          expect(result.distanceMeters, 45);
        },
      );
    });
  });

  group('ShiftsRemoteDataSource.getShiftDetail', () {
    test('gets and parses shift detail', () async {
      when(() => api.get(Endpoints.shiftDetail('shift-id'))).thenAnswer(
        (_) async => Response<dynamic>(
          requestOptions: RequestOptions(
            path: Endpoints.shiftDetail('shift-id'),
          ),
          data: <String, dynamic>{'shift': shiftJson()},
        ),
      );

      final Either<AppError, Shift> result = await dataSource.getShiftDetail(
        'shift-id',
      );

      verify(() => api.get(Endpoints.shiftDetail('shift-id'))).called(1);
      result.fold(
        (AppError error) => fail('Expected shift, got $error'),
        (Shift shift) => expect(shift.id, 'shift-id'),
      );
    });

    test('returns AppError when the API request fails', () async {
      when(() => api.get(Endpoints.shiftDetail('shift-id'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(
            path: Endpoints.shiftDetail('shift-id'),
          ),
          message: 'Server error',
        ),
      );

      final Either<AppError, Shift> result = await dataSource.getShiftDetail(
        'shift-id',
      );

      expect(result.isLeft(), isTrue);
    });
  });
}
