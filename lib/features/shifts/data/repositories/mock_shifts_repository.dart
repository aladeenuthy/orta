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
          .where((Shift shift) => shift.status == status.value)
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
    address: '42 Market Road',
    postCode: 'E1 6AN',
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
      startTime: '10:00 PM',
      finishTime: '02:00 AM',
      numOfShiftsPerDay: 1,
      location: _warehouseA,
      date: DateTime(2026, 4, 25),
      status: ShiftStatusFilter.inProgress.value,
      pay: 120,
    ),
    Shift(
      id: 'ongoing-2',
      title: 'Warehouse B',
      role: 'Loader',
      typeOfShift: <String>['night'],
      user: 'Steve abidan',
      startTime: '08:30 PM',
      finishTime: '12:30 AM',
      numOfShiftsPerDay: 1,
      location: _warehouseB,
      date: DateTime(2026, 4, 24),
      status: ShiftStatusFilter.inProgress.value,
      pay: 95,
    ),
    Shift(
      id: 'scheduled-1',
      title: 'Warehouse A',
      role: 'Picker',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: '10:00 PM',
      finishTime: '02:00 AM',
      numOfShiftsPerDay: 1,
      location: _warehouseA,
      date: DateTime(2026, 4, 25),
      status: ShiftStatusFilter.scheduled.value,
      pay: 120,
    ),
    Shift(
      id: 'scheduled-2',
      title: 'Warehouse A',
      role: 'Picker',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: '10:00 PM',
      finishTime: '02:00 AM',
      numOfShiftsPerDay: 1,
      location: _warehouseA,
      date: DateTime(2026, 4, 24),
      status: ShiftStatusFilter.scheduled.value,
      pay: 120,
    ),
    Shift(
      id: 'scheduled-3',
      title: 'Warehouse A',
      role: 'Picker',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: '10:00 PM',
      finishTime: '02:00 AM',
      numOfShiftsPerDay: 1,
      location: _warehouseA,
      date: DateTime(2026, 4, 23),
      status: ShiftStatusFilter.scheduled.value,
      pay: 120,
    ),
    Shift(
      id: 'scheduled-4',
      title: 'Warehouse B',
      role: 'Loader',
      typeOfShift: <String>['day'],
      user: 'Steve abidan',
      startTime: '09:00 AM',
      finishTime: '05:00 PM',
      numOfShiftsPerDay: 1,
      location: _warehouseB,
      date: DateTime(2026, 4, 22),
      status: ShiftStatusFilter.scheduled.value,
      pay: 105,
    ),
  ];
}
