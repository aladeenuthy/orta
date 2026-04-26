import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

import '../../shift_test_helpers.dart';

class MockShiftsRemoteDataSource extends Mock
    implements ShiftsRemoteDataSource {}

void main() {
  late MockShiftsRemoteDataSource remoteDataSource;
  late ShiftsRepositoryImpl repository;

  setUp(() {
    remoteDataSource = MockShiftsRemoteDataSource();
    repository = ShiftsRepositoryImpl(remoteDataSource: remoteDataSource);
  });

  group('ShiftsRepositoryImpl.cancelShift', () {
    test('delegates to remote data source', () async {
      when(
        () => remoteDataSource.cancelShift('shift-id'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await repository.cancelShift(
        'shift-id',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => remoteDataSource.cancelShift('shift-id')).called(1);
    });
  });

  group('ShiftsRepositoryImpl.clockIn', () {
    test('delegates to remote data source', () async {
      when(
        () => remoteDataSource.clockIn('shift-id'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await repository.clockIn(
        'shift-id',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => remoteDataSource.clockIn('shift-id')).called(1);
    });
  });

  group('ShiftsRepositoryImpl.clockOut', () {
    test('delegates to remote data source', () async {
      when(
        () => remoteDataSource.clockOut('shift-id'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await repository.clockOut(
        'shift-id',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => remoteDataSource.clockOut('shift-id')).called(1);
    });
  });

  group('ShiftsRepositoryImpl.getMyShifts', () {
    test('delegates to remote data source', () async {
      final PaginatedResponse<Shift> paginatedResponse =
          PaginatedResponse<Shift>(
            data: <Shift>[shiftModel()],
            total: 1,
            page: 1,
            hasNextPage: false,
          );
      when(
        () => remoteDataSource.getMyShifts(
          page: 2,
          limit: 5,
          status: ShiftStatusFilter.active,
          sortBy: ShiftSortBy.date,
          sortOrder: ShiftSortOrder.asc,
        ),
      ).thenAnswer(
        (_) async =>
            Right<AppError, PaginatedResponse<Shift>>(paginatedResponse),
      );

      final Either<AppError, PaginatedResponse<Shift>> result = await repository
          .getMyShifts(
            page: 2,
            limit: 5,
            status: ShiftStatusFilter.active,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.asc,
          );

      expect(
        result,
        equals(Right<AppError, PaginatedResponse<Shift>>(paginatedResponse)),
      );
      verify(
        () => remoteDataSource.getMyShifts(
          page: 2,
          limit: 5,
          status: ShiftStatusFilter.active,
          sortBy: ShiftSortBy.date,
          sortOrder: ShiftSortOrder.asc,
        ),
      ).called(1);
    });
  });

  group('ShiftsRepositoryImpl.getShiftDetail', () {
    test('delegates to remote data source', () async {
      final Shift shift = shiftModel();
      when(
        () => remoteDataSource.getShiftDetail('shift-id'),
      ).thenAnswer((_) async => Right<AppError, Shift>(shift));

      final Either<AppError, Shift> result = await repository.getShiftDetail(
        'shift-id',
      );

      expect(result, equals(Right<AppError, Shift>(shift)));
      verify(() => remoteDataSource.getShiftDetail('shift-id')).called(1);
    });
  });
}
