import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class MockShiftsRepository implements ShiftsRepository {
  const MockShiftsRepository();

  @override
  Future<Either<AppError, Unit>> cancelShift(String id) async {
    return right<AppError, Unit>(unit);
  }

  @override
  Future<Either<AppError, Unit>> clockIn(String id) async {
    return right<AppError, Unit>(unit);
  }

  @override
  Future<Either<AppError, Unit>> clockOut(String id) async {
    return right<AppError, Unit>(unit);
  }

  @override
  Future<Either<AppError, PaginatedResponse<Shift>>> getMyShifts({
    required int page,
    required int limit,
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 450));

    List<Shift> shifts = _mockShifts;
    if (status != null) {
      shifts = shifts
          .where((Shift shift) => shift.status?.matchesFilter(status) ?? false)
          .toList();
    }

    shifts = <Shift>[...shifts]
      ..sort((Shift a, Shift b) {
        final int comparison = a.date.compareTo(b.date);
        return sortOrder == ShiftSortOrder.asc ? comparison : -comparison;
      });

    final int start = (page - 1) * limit;
    final int end = (start + limit).clamp(0, shifts.length);
    final List<Shift> pageData = start >= shifts.length
        ? <Shift>[]
        : shifts.sublist(start, end);
    final int totalPages = shifts.isEmpty ? 1 : (shifts.length / limit).ceil();

    return right<AppError, PaginatedResponse<Shift>>(
      PaginatedResponse<Shift>(
        data: pageData,
        currentPage: page,
        totalPages: totalPages,
        totalCount: shifts.length,
        hasNextPage: page < totalPages,
        hasPrevPage: page > 1,
        limit: limit,
      ),
    );
  }

  @override
  Future<Either<AppError, Shift>> getShiftDetail(String id) async {
    final Shift shift = _mockShifts.firstWhere(
      (Shift shift) => shift.id == id,
      orElse: () => _mockShifts.first,
    );

    return right<AppError, Shift>(shift);
  }

  static final Location _warehouseA = Location(
    name: 'Warehouse A',
    address: '14155 Sullyfield Circle',
    postCode: 'Suite H, Chantilly, VA 20121',
    coordinates: Coordinates(latitude: 51.5202, longitude: -0.0719),
  );

  static final Location _warehouseB = Location(
    name: 'Warehouse B',
    address: '12 Southbank Lane',
    postCode: 'SE1 9PX',
    coordinates: Coordinates(latitude: 51.5033, longitude: -0.1195),
  );

  static final List<Shift> _mockShifts = <Shift>[
    Shift(
      id: 'ongoing-1',
      title: 'Warehouse A',
      role: 'Picker',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: DateTime(2026, 4, 25, 22),
      finishTime: DateTime(2026, 4, 26, 2),
      numOfShiftsPerDay: 1,
      location: _warehouseA,
      date: DateTime(2026, 4, 25),
      status: ShiftStatus.inProgress,
      pay: 120,
    ),
    Shift(
      id: 'ongoing-2',
      title: 'Warehouse B',
      role: 'Loader',
      typeOfShift: <String>['night'],
      user: 'Steve abidan',
      startTime: DateTime(2026, 4, 24, 20, 30),
      finishTime: DateTime(2026, 4, 25, 0, 30),
      numOfShiftsPerDay: 1,
      location: _warehouseB,
      date: DateTime(2026, 4, 24),
      status: ShiftStatus.inProgress,
      pay: 95,
    ),
    Shift(
      id: 'scheduled-1',
      title: 'Warehouse A',
      role: 'Picker',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: DateTime(2026, 4, 25, 22),
      finishTime: DateTime(2026, 4, 26, 2),
      numOfShiftsPerDay: 1,
      location: _warehouseA,
      date: DateTime(2026, 4, 25),
      status: ShiftStatus.scheduled,
      pay: 120,
    ),
    Shift(
      id: 'scheduled-2',
      title: 'Warehouse A',
      role: 'Picker',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: DateTime(2026, 4, 24, 22),
      finishTime: DateTime(2026, 4, 25, 2),
      numOfShiftsPerDay: 1,
      location: _warehouseA,
      date: DateTime(2026, 4, 24),
      status: ShiftStatus.scheduled,
      pay: 120,
    ),
    Shift(
      id: 'scheduled-3',
      title: 'Warehouse A',
      role: 'Picker',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: DateTime(2026, 4, 23, 22),
      finishTime: DateTime(2026, 4, 24, 2),
      numOfShiftsPerDay: 1,
      location: _warehouseA,
      date: DateTime(2026, 4, 23),
      status: ShiftStatus.scheduled,
      pay: 120,
    ),
    Shift(
      id: 'scheduled-4',
      title: 'Warehouse B',
      role: 'Loader',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: DateTime(2026, 4, 22, 9),
      finishTime: DateTime(2026, 4, 22, 17),
      numOfShiftsPerDay: 1,
      location: _warehouseB,
      date: DateTime(2026, 4, 22),
      status: ShiftStatus.scheduled,
      pay: 105,
    ),
  ];
}
