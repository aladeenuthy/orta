import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late MockProfileRepository repository;

  setUp(() {
    repository = MockProfileRepository();
  });

  group('ProfileService', () {
    test('rejects incomplete personal information', () async {
      final ProfileService service = ProfileService(repository: repository);

      final Either<AppError, Unit> result = service.validatePersonalInformation(
        phone: '',
        city: 'London',
        jobRole: 'Nurse',
      );

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
      const Profile profile = Profile(
        id: 'id',
        name: 'Worker',
        email: 'worker@example.com',
        skills: <String>['First Aid'],
      );
      when(
        () => repository.updateProfile(skills: <String>['First Aid']),
      ).thenAnswer((_) async => const Right<AppError, Profile>(profile));
      final ProfileService service = ProfileService(repository: repository);

      final Either<AppError, Profile> result = await service.saveSkills(
        skills: <String>['First Aid'],
      );

      expect(result, const Right<AppError, Profile>(profile));
    });

    test(
      'saves personal information and skills in one profile update',
      () async {
        const Profile profile = Profile(
          id: 'id',
          name: 'Updated Worker',
          email: 'worker@example.com',
          phone: '+447911123456',
          city: 'London',
          jobRole: 'Nurse',
          profilePictureUrl: '/tmp/profile.png',
          skills: <String>['First Aid'],
        );
        when(
          () => repository.updateProfile(
            phone: '+447911123456',
            name: 'Updated Worker',
            city: 'London',
            jobRole: 'Nurse',
            skills: <String>['First Aid'],
            profilePictureUrl: '/tmp/profile.png',
          ),
        ).thenAnswer((_) async => const Right<AppError, Profile>(profile));
        final ProfileService service = ProfileService(repository: repository);

        final Either<AppError, Profile> result = await service.saveProfile(
          phone: '+447911123456',
          name: 'Updated Worker',
          city: 'London',
          jobRole: 'Nurse',
          skills: <String>['First Aid'],
          profilePictureUrl: '/tmp/profile.png',
        );

        expect(result, const Right<AppError, Profile>(profile));
      },
    );
  });

  group('AvailabilityService', () {
    test('requires all seven weekdays', () async {
      final AvailabilityService service = AvailabilityService(
        repository: repository,
      );

      final Either<AppError, List<AvailabilityDay>> result = await service
          .saveAvailability(
            weeklySchedule: const <AvailabilityDay>[
              AvailabilityDay(day: 'Monday'),
            ],
          );

      expect(result.isLeft(), isTrue);
    });

    test('returns updated availability from repository after save', () async {
      final AvailabilityService service = AvailabilityService(
        repository: repository,
      );
      const List<AvailabilityDay> schedule = <AvailabilityDay>[
        AvailabilityDay(day: 'Monday', isAvailable: true),
        AvailabilityDay(day: 'Tuesday', isAvailable: true),
        AvailabilityDay(day: 'Wednesday'),
        AvailabilityDay(day: 'Thursday', isAvailable: true),
        AvailabilityDay(day: 'Friday', isAvailable: true),
        AvailabilityDay(day: 'Saturday'),
        AvailabilityDay(day: 'Sunday'),
      ];
      when(
        () => repository.saveAvailability(weeklySchedule: schedule),
      ).thenAnswer(
        (_) async => const Right<AppError, List<AvailabilityDay>>(schedule),
      );

      final Either<AppError, List<AvailabilityDay>> result = await service
          .saveAvailability(weeklySchedule: schedule);

      expect(result, const Right<AppError, List<AvailabilityDay>>(schedule));
    });
  });

  group('UnavailabilityService', () {
    test('rejects end dates before start dates', () async {
      final UnavailabilityService service = UnavailabilityService(
        repository: repository,
      );

      final Either<AppError, List<UnavailabilityPeriod>> result = await service
          .saveUnavailability(
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

    test('returns updated unavailability from repository after save', () async {
      final UnavailabilityService service = UnavailabilityService(
        repository: repository,
      );
      final List<UnavailabilityPeriod> items = <UnavailabilityPeriod>[
        UnavailabilityPeriod(
          id: 'id',
          startDate: DateTime(2026, 12, 24),
          endDate: DateTime(2026, 12, 26),
          reason: 'Christmas',
        ),
      ];
      when(
        () => repository.saveUnavailability(unavailableDates: items),
      ).thenAnswer(
        (_) async => Right<AppError, List<UnavailabilityPeriod>>(items),
      );

      final Either<AppError, List<UnavailabilityPeriod>> result = await service
          .saveUnavailability(unavailableDates: items);

      expect(result, Right<AppError, List<UnavailabilityPeriod>>(items));
    });
  });
}
