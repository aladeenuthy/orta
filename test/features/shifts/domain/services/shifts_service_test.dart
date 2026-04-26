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

  group('ShiftsService.getMyShifts', () {
    test('delegates to repository', () async {
      final PaginatedResponse<Shift> paginatedResponse =
          PaginatedResponse<Shift>(
            data: <Shift>[shiftModel()],
            total: 1,
            page: 1,
            hasNextPage: false,
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
