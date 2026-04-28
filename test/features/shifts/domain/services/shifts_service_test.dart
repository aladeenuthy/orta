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

  group('ShiftsService.claimShift', () {
    test('delegates to repository', () async {
      final Shift shift = shiftModel();
      when(
        () => repository.claimShift('shift-id'),
      ).thenAnswer((_) async => Right<AppError, Shift>(shift));

      final Either<AppError, Shift> result = await service.claimShift(
        'shift-id',
      );

      expect(result, equals(Right<AppError, Shift>(shift)));
      verify(() => repository.claimShift('shift-id')).called(1);
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

  group('ShiftsService.getMarketplaceShifts', () {
    test('delegates to repository', () async {
      final PaginatedResponse<Shift> paginatedResponse =
          PaginatedResponse<Shift>(
            data: <Shift>[shiftModel()],
            currentPage: 1,
            totalPages: 1,
            totalCount: 1,
            hasNextPage: false,
            hasPrevPage: false,
            limit: 10,
          );
      final DateTime date = DateTime(2026, 5, 5);
      when(
        () => repository.getMarketplaceShifts(
          page: 1,
          limit: 10,
          role: 'Nurse',
          date: date,
          typeOfShift: 'Morning',
          sortOrder: ShiftSortOrder.desc,
        ),
      ).thenAnswer(
        (_) async =>
            Right<AppError, PaginatedResponse<Shift>>(paginatedResponse),
      );

      final Either<AppError, PaginatedResponse<Shift>> result = await service
          .getMarketplaceShifts(
            page: 1,
            limit: 10,
            role: 'Nurse',
            date: date,
            typeOfShift: 'Morning',
            sortOrder: ShiftSortOrder.desc,
          );

      expect(
        result,
        equals(Right<AppError, PaginatedResponse<Shift>>(paginatedResponse)),
      );
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

  group('ShiftsService.verifyLocation', () {
    test('delegates to repository', () async {
      const LocationVerificationResult verification =
          LocationVerificationResult(
            withinRange: true,
            distanceMeters: 45,
            radiusMeters: 200,
          );
      when(
        () => repository.verifyLocation(
          id: 'shift-id',
          latitude: 53.4808,
          longitude: -2.2426,
        ),
      ).thenAnswer(
        (_) async =>
            const Right<AppError, LocationVerificationResult>(verification),
      );

      final Either<AppError, LocationVerificationResult> result = await service
          .verifyLocation(
            id: 'shift-id',
            latitude: 53.4808,
            longitude: -2.2426,
          );

      expect(
        result,
        equals(const Right<AppError, LocationVerificationResult>(verification)),
      );
    });
  });
}
