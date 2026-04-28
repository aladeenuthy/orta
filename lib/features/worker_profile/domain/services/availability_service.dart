import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AvailabilityService {
  AvailabilityService({required WorkerProfileRepository repository})
    : _repository = repository;

  final WorkerProfileRepository _repository;

  Future<Either<AppError, List<AvailabilityDay>>> getAvailability() {
    return _repository.getAvailability();
  }

  Future<Either<AppError, Unit>> saveAvailability({
    required List<AvailabilityDay> weeklySchedule,
  }) {
    if (weeklySchedule.length != 7) {
      return Future.value(left(const AppError('Select all weekdays')));
    }

    return _repository.saveAvailability(weeklySchedule: weeklySchedule);
  }
}
