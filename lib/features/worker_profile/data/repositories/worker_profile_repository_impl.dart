import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class WorkerProfileRepositoryImpl implements WorkerProfileRepository {
  WorkerProfileRepositoryImpl({required WorkerProfileRemoteDataSource remote})
    : _remote = remote;

  final WorkerProfileRemoteDataSource _remote;

  WorkerProfile _profile = const WorkerProfile(
    id: 'mock-worker',
    name: 'Abdulmalik Uthman',
    email: 'worker@example.com',
    isProfileComplete: false,
  );
  List<AvailabilityDay> _availability = WorkerProfileDefaults.availability;
  final List<UnavailabilityPeriod> _unavailability = <UnavailabilityPeriod>[];

  bool get _useMock => true;

  @override
  Future<Either<AppError, WorkerProfile>> getProfile() {
    if (_useMock) return Future.value(right(_profile));
    return _remote.getProfile();
  }

  @override
  Future<Either<AppError, WorkerProfile>> updateProfile({
    String? phone,
    String? city,
    String? jobRole,
    List<String>? skills,
    String? profilePictureUrl,
  }) async {
    if (!_useMock) {
      return _remote.updateProfile(
        phone: phone,
        city: city,
        jobRole: jobRole,
        skills: skills,
        profilePictureUrl: profilePictureUrl,
      );
    }

    _profile = _profile.copyWith(
      phone: phone ?? _profile.phone,
      city: city ?? _profile.city,
      jobRole: jobRole ?? _profile.jobRole,
      skills: skills ?? _profile.skills,
      profilePictureUrl: profilePictureUrl ?? _profile.profilePictureUrl,
    );
    _profile = _profile.copyWith(
      isProfileComplete:
          (_profile.phone?.isNotEmpty ?? false) &&
          (_profile.city?.isNotEmpty ?? false) &&
          (_profile.jobRole?.isNotEmpty ?? false),
    );

    return right(_profile);
  }

  @override
  Future<Either<AppError, List<AvailabilityDay>>> getAvailability() {
    if (_useMock) return Future.value(right(_availability));
    return _remote.getAvailability();
  }

  @override
  Future<Either<AppError, Unit>> saveAvailability({
    required List<AvailabilityDay> weeklySchedule,
  }) {
    if (_useMock) {
      _availability = weeklySchedule;
      return Future.value(right(unit));
    }

    return _remote.saveAvailability(weeklySchedule: weeklySchedule);
  }

  @override
  Future<Either<AppError, List<UnavailabilityPeriod>>> getUnavailability({
    String? month,
  }) {
    if (_useMock) return Future.value(right(_unavailability));
    return _remote.getUnavailability(month: month);
  }

  @override
  Future<Either<AppError, Unit>> saveUnavailability({
    required List<UnavailabilityPeriod> unavailableDates,
  }) {
    if (_useMock) {
      _unavailability.addAll(unavailableDates);
      return Future.value(right(unit));
    }

    return _remote.saveUnavailability(unavailableDates: unavailableDates);
  }

  @override
  Future<Either<AppError, Unit>> deleteUnavailability(String id) {
    if (_useMock) {
      _unavailability.removeWhere((UnavailabilityPeriod item) => item.id == id);
      return Future.value(right(unit));
    }

    return _remote.deleteUnavailability(id);
  }
}

class WorkerProfileDefaults {
  const WorkerProfileDefaults._();

  static const List<AvailabilityDay> availability = <AvailabilityDay>[
    AvailabilityDay(day: 'Monday'),
    AvailabilityDay(day: 'Tuesday'),
    AvailabilityDay(day: 'Wednesday'),
    AvailabilityDay(day: 'Thursday'),
    AvailabilityDay(day: 'Friday'),
    AvailabilityDay(day: 'Saturday'),
    AvailabilityDay(day: 'Sunday'),
  ];

  static const List<String> cities = <String>[
    'London',
    'Manchester',
    'Birmingham',
    'Liverpool',
    'Leeds',
  ];

  static const List<String> roles = <String>[
    'Nurse',
    'Caregiver',
    'Cleaner',
    'Support Worker',
    'Care Assistant',
  ];
}
