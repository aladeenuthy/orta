import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AvailabilityService {
  AvailabilityService({required ProfileRepository repository})
    : _repository = repository;

  final ProfileRepository _repository;

  Future<Either<AppError, List<AvailabilityDay>>> getAvailability() {
    return _repository.getAvailability();
  }

  Future<Either<AppError, List<AvailabilityDay>>> saveAvailability({
    required List<AvailabilityDay> weeklySchedule,
  }) {
    if (weeklySchedule.length != 7) {
      return Future.value(left(const AppError('Select all weekdays')));
    }

    return _repository.saveAvailability(weeklySchedule: weeklySchedule);
  }
}
