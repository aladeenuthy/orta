import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required ProfileRemoteDataSource remote})
    : _remote = remote;

  final ProfileRemoteDataSource _remote;

  @override
  Future<Either<AppError, Profile>> getProfile() {
    return _remote.getProfile();
  }

  @override
  Future<Either<AppError, Profile>> updateProfile({
    String? name,
    String? phone,
    String? city,
    String? jobRole,
    List<String>? skills,
    String? profilePictureUrl,
  }) async {
    return _remote.updateProfile(
      phone: phone,
      name: name,
      city: city,
      jobRole: jobRole,
      skills: skills,
      profilePictureUrl: profilePictureUrl,
    );
  }

  @override
  Future<Either<AppError, List<AvailabilityDay>>> getAvailability() {
    return _remote.getAvailability();
  }

  @override
  Future<Either<AppError, List<AvailabilityDay>>> saveAvailability({
    required List<AvailabilityDay> weeklySchedule,
  }) {
    return _remote.saveAvailability(weeklySchedule: weeklySchedule);
  }

  @override
  Future<Either<AppError, List<UnavailabilityPeriod>>> getUnavailability({
    String? month,
  }) {
    return _remote.getUnavailability(month: month);
  }

  @override
  Future<Either<AppError, List<UnavailabilityPeriod>>> saveUnavailability({
    required List<UnavailabilityPeriod> unavailableDates,
  }) {
    return _remote.saveUnavailability(unavailableDates: unavailableDates);
  }

  @override
  Future<Either<AppError, Unit>> deleteUnavailability(String id) {
    return _remote.deleteUnavailability(id);
  }
}

class ProfileDefaults {
  const ProfileDefaults._();

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
