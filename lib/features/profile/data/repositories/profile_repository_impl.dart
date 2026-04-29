import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required ProfileRemoteDataSource remote})
    : _remote = remote;

  final ProfileRemoteDataSource _remote;
  List<AvailabilityDay> _availability = ProfileDefaults.availability;
  final List<UnavailabilityPeriod> _unavailability = <UnavailabilityPeriod>[];

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
    return Future.value(right(_availability));
  }

  @override
  Future<Either<AppError, Unit>> saveAvailability({
    required List<AvailabilityDay> weeklySchedule,
  }) {
    _availability = weeklySchedule;
    return Future.value(right(unit));
  }

  @override
  Future<Either<AppError, List<UnavailabilityPeriod>>> getUnavailability({
    String? month,
  }) {
    return Future.value(right(_unavailability));
  }

  @override
  Future<Either<AppError, Unit>> saveUnavailability({
    required List<UnavailabilityPeriod> unavailableDates,
  }) {
    _unavailability.addAll(unavailableDates);
    return Future.value(right(unit));
  }

  @override
  Future<Either<AppError, Unit>> deleteUnavailability(String id) {
    _unavailability.removeWhere((UnavailabilityPeriod item) => item.id == id);
    return Future.value(right(unit));
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
