import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

import '../../shift_test_helpers.dart';

class MockShiftsRepository extends Mock implements ShiftsRepository {}

void main() {
  late MockShiftsRepository repository;
  late ShiftsService service;

  setUp(() {
    repository = MockShiftsRepository();
    service = ShiftsService(repository: repository);
  });

  group('ShiftsService.cancelShift', () {
    test('delegates to repository', () async {
      when(
        () => repository.cancelShift('shift-id'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await service.cancelShift(
        'shift-id',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => repository.cancelShift('shift-id')).called(1);
    });
  });

  group('ShiftsService.clockIn', () {
    test('delegates to repository', () async {
      when(
        () => repository.clockIn('shift-id'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await service.clockIn('shift-id');

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => repository.clockIn('shift-id')).called(1);
    });
  });

  group('ShiftsService.clockOut', () {
    test('delegates to repository', () async {
      when(
        () => repository.clockOut('shift-id'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await service.clockOut('shift-id');

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => repository.clockOut('shift-id')).called(1);
    });
  });

  group('ShiftsService.getMyShifts', () {
    test('delegates to repository', () async {
      final PaginatedResponse<Shift> paginatedResponse =
          PaginatedResponse<Shift>(
            data: <Shift>[shiftModel()],
            currentPage: 1,
            totalPages: 1,
            totalCount: 1,
            hasNextPage: false,
            hasPrevPage: false,
            limit: 5,
          );
      when(
        () => repository.getMyShifts(
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

      final Either<AppError, PaginatedResponse<Shift>> result = await service
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
        () => repository.getMyShifts(
          page: 2,
          limit: 5,
          status: ShiftStatusFilter.active,
          sortBy: ShiftSortBy.date,
          sortOrder: ShiftSortOrder.asc,
        ),
      ).called(1);
    });
  });

  group('ShiftsService.getShiftDetail', () {
    test('delegates to repository', () async {
      final Shift shift = shiftModel();
      when(
        () => repository.getShiftDetail('shift-id'),
      ).thenAnswer((_) async => Right<AppError, Shift>(shift));

      final Either<AppError, Shift> result = await service.getShiftDetail(
        'shift-id',
      );

      expect(result, equals(Right<AppError, Shift>(shift)));
      verify(() => repository.getShiftDetail('shift-id')).called(1);
    });
  });
}
