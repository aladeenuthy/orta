import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

abstract class WorkerProfileRepository {
  Future<Either<AppError, WorkerProfile>> getProfile();

  Future<Either<AppError, WorkerProfile>> updateProfile({
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
