import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ShiftsRepositoryImpl implements ShiftsRepository {
  ShiftsRepositoryImpl({required ShiftsRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final ShiftsRemoteDataSource _remoteDataSource;
  final bool _useMarketplaceMock = true;
  final bool _useVerifyLocationMock = true;
  late List<Shift> _marketplaceShifts = _mockMarketplaceShifts();

  @override
  Future<Either<AppError, Unit>> cancelShift(String id) {
    return _remoteDataSource.cancelShift(id);
  }

  @override
  Future<Either<AppError, Unit>> clockIn(String id) {
    return _remoteDataSource.clockIn(id);
  }

  @override
  Future<Either<AppError, Unit>> clockOut(String id) {
    return _remoteDataSource.clockOut(id);
  }

  @override
  Future<Either<AppError, Shift>> claimShift(String id) {
    if (!_useMarketplaceMock) {
      return _remoteDataSource.claimShift(id);
    }

    final int index = _marketplaceShifts.indexWhere(
      (Shift shift) => shift.id == id,
    );
    if (index == -1) {
      return Future.value(left(const AppError('Shift not found')));
    }

    final Shift claimedShift = _marketplaceShifts[index].copyWith(
      user: 'You',
      status: ShiftStatus.scheduled,
    );
    _marketplaceShifts = <Shift>[
      ..._marketplaceShifts.take(index),
      ..._marketplaceShifts.skip(index + 1),
    ];

    return Future.value(right(claimedShift));
  }

  @override
  Future<Either<AppError, PaginatedResponse<Shift>>> getMarketplaceShifts({
    required int page,
    required int limit,
    String? role,
    DateTime? date,
    String? typeOfShift,
    ShiftSortOrder? sortOrder,
  }) {
    if (!_useMarketplaceMock) {
      return _remoteDataSource.getMarketplaceShifts(
        page: page,
        limit: limit,
        role: role,
        date: date,
        typeOfShift: typeOfShift,
        sortOrder: sortOrder,
      );
    }

    Iterable<Shift> filtered = _marketplaceShifts;
    if (role != null && role.isNotEmpty) {
      filtered = filtered.where((Shift shift) => shift.role == role);
    }
    if (typeOfShift != null && typeOfShift.isNotEmpty) {
      filtered = filtered.where(
        (Shift shift) => shift.typeOfShift.contains(typeOfShift),
      );
    }
    if (date != null) {
      filtered = filtered.where(
        (Shift shift) =>
            DateUtils.dateOnly(shift.date) == DateUtils.dateOnly(date),
      );
    }

    final List<Shift> sorted = filtered.toList()
      ..sort((Shift a, Shift b) => b.date.compareTo(a.date));
    if (sortOrder == ShiftSortOrder.asc) {
      sorted.sort((Shift a, Shift b) => a.date.compareTo(b.date));
    }

    final int start = (page - 1) * limit;
    final List<Shift> pageItems = start >= sorted.length
        ? <Shift>[]
        : sorted.skip(start).take(limit).toList();
    final int totalPages = sorted.isEmpty ? 1 : (sorted.length / limit).ceil();

    return Future.value(
      right(
        PaginatedResponse<Shift>(
          data: pageItems,
          currentPage: page,
          totalPages: totalPages,
          totalCount: sorted.length,
          hasNextPage: page < totalPages,
          hasPrevPage: page > 1,
          limit: limit,
        ),
      ),
    );
  }

  @override
  Future<Either<AppError, PaginatedResponse<Shift>>> getMyShifts({
    required int page,
    required int limit,
    ShiftStatusFilter? status,
    ShiftSortBy? sortBy,
    ShiftSortOrder? sortOrder,
  }) {
    return _remoteDataSource.getMyShifts(
      page: page,
      limit: limit,
      status: status,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  @override
  Future<Either<AppError, Shift>> getShiftDetail(String id) {
    return _remoteDataSource.getShiftDetail(id);
  }

  @override
  Future<Either<AppError, LocationVerificationResult>> verifyLocation({
    required String id,
    required double latitude,
    required double longitude,
  }) {
    if (!_useVerifyLocationMock) {
      return _remoteDataSource.verifyLocation(
        id: id,
        latitude: latitude,
        longitude: longitude,
      );
    }

    return Future.value(
      right(
        const LocationVerificationResult(
          withinRange: true,
          distanceMeters: 45,
          radiusMeters: 200,
        ),
      ),
    );
  }

  static List<Shift> _mockMarketplaceShifts() {
    final DateTime date = DateTime(2026, 4, 25);
    final Location warehouseA = _mockLocation('loc-a', 'Warehouse A');
    final Location careHome = _mockLocation('loc-b', 'Care Home');
    final Location warehouseB = _mockLocation('loc-c', 'Warehouse B');

    return <Shift>[
      _mockShift(
        'market-1',
        'Warehouse Operative',
        'Care Assistant',
        warehouseA,
        date,
        <String>['Morning'],
      ),
      _mockShift(
        'market-2',
        'Urgent Care Cover',
        'Caregiver',
        careHome,
        date.add(const Duration(days: 1)),
        <String>['Evening'],
      ),
      _mockShift(
        'market-3',
        'Cash Handling Support',
        'Cleaner',
        warehouseB,
        date.add(const Duration(days: 2)),
        <String>['Weekend'],
      ),
      _mockShift(
        'market-4',
        'Warehouse Backup',
        'Support Worker',
        warehouseA,
        date.add(const Duration(days: 3)),
        <String>['Night'],
      ),
      _mockShift(
        'market-5',
        'Care Assistant Shift',
        'Nurse',
        careHome,
        date.add(const Duration(days: 4)),
        <String>['Weekday'],
      ),
    ];
  }

  static Location _mockLocation(String id, String name) {
    return Location(
      id: id,
      name: name,
      address: '25 Market Street, Manchester',
      coordinates: const Coordinates(latitude: 53.4808, longitude: -2.2426),
    );
  }

  static Shift _mockShift(
    String id,
    String title,
    String role,
    Location location,
    DateTime date,
    List<String> typeOfShift,
  ) {
    return Shift(
      id: id,
      title: title,
      role: role,
      typeOfShift: typeOfShift,
      user: '',
      startTime: DateTime(1970, 1, 1, 22),
      finishTime: DateTime(1970, 1, 2, 6),
      numOfShiftsPerDay: 3,
      location: location,
      status: ShiftStatus.scheduled,
      date: date,
      createdAt: date,
      pay: 120,
    );
  }
}
