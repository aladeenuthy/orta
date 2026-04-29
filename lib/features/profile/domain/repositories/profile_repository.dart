import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

abstract class ProfileRepository {
  Future<Either<AppError, Profile>> getProfile();

  Future<Either<AppError, Profile>> updateProfile({
    String? name,
    String? phone,
    String? city,
    String? jobRole,
    List<String>? skills,
    String? profilePictureUrl,
  });

  Future<Either<AppError, List<AvailabilityDay>>> getAvailability();

  Future<Either<AppError, Unit>> saveAvailability({
    required List<AvailabilityDay> weeklySchedule,
  });

  Future<Either<AppError, List<UnavailabilityPeriod>>> getUnavailability({
    String? month,
  });

  Future<Either<AppError, Unit>> saveUnavailability({
    required List<UnavailabilityPeriod> unavailableDates,
  });

  Future<Either<AppError, Unit>> deleteUnavailability(String id);
}
