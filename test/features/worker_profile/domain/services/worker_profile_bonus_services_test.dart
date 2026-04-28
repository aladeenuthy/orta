import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockWorkerProfileRepository extends Mock
    implements WorkerProfileRepository {}

void main() {
  late MockWorkerProfileRepository repository;

  setUp(() {
    repository = MockWorkerProfileRepository();
  });

  group('WorkerProfileService', () {
    test('rejects incomplete personal information', () async {
      final WorkerProfileService service = WorkerProfileService(
        repository: repository,
      );

      final Either<AppError, WorkerProfile> result = await service
          .savePersonalInformation(phone: '', city: 'London', jobRole: 'Nurse');

      expect(result.isLeft(), isTrue);
      verifyNever(
        () => repository.updateProfile(
          phone: any(named: 'phone'),
          city: any(named: 'city'),
          jobRole: any(named: 'jobRole'),
        ),
      );
    });

    test('saves skills when at least one is present', () async {
      const WorkerProfile profile = WorkerProfile(
        id: 'id',
        name: 'Worker',
        email: 'worker@example.com',
        skills: <String>['First Aid'],
      );
      when(
        () => repository.updateProfile(skills: <String>['First Aid']),
      ).thenAnswer((_) async => const Right<AppError, WorkerProfile>(profile));
      final WorkerProfileService service = WorkerProfileService(
        repository: repository,
      );

      final Either<AppError, WorkerProfile> result = await service.saveSkills(
        skills: <String>['First Aid'],
      );

      expect(result, const Right<AppError, WorkerProfile>(profile));
    });
  });

  group('AvailabilityService', () {
    test('requires all seven weekdays', () async {
      final AvailabilityService service = AvailabilityService(
        repository: repository,
      );

      final Either<AppError, Unit> result = await service.saveAvailability(
        weeklySchedule: const <AvailabilityDay>[AvailabilityDay(day: 'Monday')],
      );

      expect(result.isLeft(), isTrue);
    });
  });

  group('UnavailabilityService', () {
    test('rejects end dates before start dates', () async {
      final UnavailabilityService service = UnavailabilityService(
        repository: repository,
      );

      final Either<AppError, Unit> result = await service.saveUnavailability(
        unavailableDates: <UnavailabilityPeriod>[
          UnavailabilityPeriod(
            id: 'id',
            startDate: DateTime(2026, 12, 26),
            endDate: DateTime(2026, 12, 24),
          ),
        ],
      );

      expect(result.isLeft(), isTrue);
    });
  });
}
