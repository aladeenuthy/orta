import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class UnavailabilityService {
  UnavailabilityService({required ProfileRepository repository})
    : _repository = repository;

  final ProfileRepository _repository;

  Future<Either<AppError, List<UnavailabilityPeriod>>> getUnavailability({
    String? month,
  }) {
    return _repository.getUnavailability(month: month);
  }

  Future<Either<AppError, List<UnavailabilityPeriod>>> saveUnavailability({
    required List<UnavailabilityPeriod> unavailableDates,
  }) {
    final DateTime today = DateTime.now();
    for (final UnavailabilityPeriod item in unavailableDates) {
      if (item.endDate.isBefore(item.startDate)) {
        return Future.value(
          left(const AppError('End date must be after start date')),
        );
      }

      if (item.startDate.isBefore(
        DateTime(today.year, today.month, today.day),
      )) {
        return Future.value(left(const AppError('Date cannot be in the past')));
      }
    }

    return _repository.saveUnavailability(unavailableDates: unavailableDates);
  }

  Future<Either<AppError, Unit>> deleteUnavailability(String id) {
    return _repository.deleteUnavailability(id);
  }
}
