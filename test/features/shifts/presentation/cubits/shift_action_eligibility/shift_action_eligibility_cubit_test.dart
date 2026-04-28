import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockLocationService extends Mock implements LocationService {}

void main() {
  late MockLocationService locationService;
  late ShiftActionRules shiftActionRules;

  setUp(() {
    locationService = MockLocationService();
    shiftActionRules = const ShiftActionRules();
  });

  ShiftActionEligibilityCubit buildCubit() {
    return ShiftActionEligibilityCubit(
      locationService: locationService,
      shiftActionRules: shiftActionRules,
    );
  }

  group('ShiftActionEligibilityCubit', () {
    blocTest<ShiftActionEligibilityCubit, ShiftActionEligibilityState>(
      'loads an enabled eligibility when location is valid',
      setUp: () {
        when(() => locationService.currentCoordinates()).thenAnswer(
          (_) async => const Right<AppError, Coordinates>(
            Coordinates(longitude: -2.2427, latitude: 53.4809),
          ),
        );
      },
      build: buildCubit,
      act: (ShiftActionEligibilityCubit cubit) => cubit.evaluate(_shift()),
      expect: () => <Matcher>[
        isA<ShiftActionEligibilityState>().having(
          (ShiftActionEligibilityState state) => state.isLoading,
          'isLoading',
          isTrue,
        ),
        isA<ShiftActionEligibilityState>()
            .having(
              (ShiftActionEligibilityState state) => state.isLoaded,
              'isLoaded',
              isTrue,
            )
            .having(
              (ShiftActionEligibilityState state) => state.eligibility?.enabled,
              'eligibility.enabled',
              isTrue,
            )
            .having(
              (ShiftActionEligibilityState state) =>
                  state.eligibility?.isWithinWorkLocation,
              'isWithinWorkLocation',
              isTrue,
            ),
      ],
    );

    blocTest<ShiftActionEligibilityCubit, ShiftActionEligibilityState>(
      'loads a disabled eligibility when location cannot be read',
      setUp: () {
        when(() => locationService.currentCoordinates()).thenAnswer(
          (_) async => const Left<AppError, Coordinates>(
            AppError(GeolocatorLocationService.permissionRequiredMessage),
          ),
        );
      },
      build: buildCubit,
      act: (ShiftActionEligibilityCubit cubit) => cubit.evaluate(_shift()),
      expect: () => <Matcher>[
        isA<ShiftActionEligibilityState>().having(
          (ShiftActionEligibilityState state) => state.isLoading,
          'isLoading',
          isTrue,
        ),
        isA<ShiftActionEligibilityState>()
            .having(
              (ShiftActionEligibilityState state) => state.isLoaded,
              'isLoaded',
              isTrue,
            )
            .having(
              (ShiftActionEligibilityState state) => state.eligibility?.enabled,
              'eligibility.enabled',
              isFalse,
            )
            .having(
              (ShiftActionEligibilityState state) =>
                  state.eligibility?.warningMessage,
              'warningMessage',
              GeolocatorLocationService.permissionRequiredMessage,
            )
            .having(
              (ShiftActionEligibilityState state) =>
                  state.eligibility?.locationAction,
              'locationAction',
              ShiftLocationAction.requestPermission,
            )
            .having(
              (ShiftActionEligibilityState state) =>
                  state.eligibility?.isWithinWorkLocation,
              'isWithinWorkLocation',
              isNull,
            ),
      ],
    );

    blocTest<ShiftActionEligibilityCubit, ShiftActionEligibilityState>(
      'marks denied forever failures as app settings actions',
      setUp: () {
        when(() => locationService.currentCoordinates()).thenAnswer(
          (_) async => const Left<AppError, Coordinates>(
            AppError(GeolocatorLocationService.permissionDeniedForeverMessage),
          ),
        );
      },
      build: buildCubit,
      act: (ShiftActionEligibilityCubit cubit) => cubit.evaluate(_shift()),
      verify: (ShiftActionEligibilityCubit cubit) {
        expect(
          cubit.state.eligibility?.locationAction,
          ShiftLocationAction.openAppSettings,
        );
      },
    );

    blocTest<ShiftActionEligibilityCubit, ShiftActionEligibilityState>(
      'opens app settings then re-evaluates location',
      setUp: () {
        when(
          () => locationService.openAppSettings(),
        ).thenAnswer((_) async => true);
        when(() => locationService.currentCoordinates()).thenAnswer(
          (_) async => const Right<AppError, Coordinates>(
            Coordinates(longitude: -2.2427, latitude: 53.4809),
          ),
        );
      },
      build: buildCubit,
      act: (ShiftActionEligibilityCubit cubit) =>
          cubit.openAppSettings(_shift()),
      verify: (_) {
        verify(() => locationService.openAppSettings()).called(1);
        verify(() => locationService.currentCoordinates()).called(1);
      },
    );

    blocTest<ShiftActionEligibilityCubit, ShiftActionEligibilityState>(
      'opens location settings then re-evaluates location',
      setUp: () {
        when(
          () => locationService.openLocationSettings(),
        ).thenAnswer((_) async => true);
        when(() => locationService.currentCoordinates()).thenAnswer(
          (_) async => const Right<AppError, Coordinates>(
            Coordinates(longitude: -2.2427, latitude: 53.4809),
          ),
        );
      },
      build: buildCubit,
      act: (ShiftActionEligibilityCubit cubit) =>
          cubit.openLocationSettings(_shift()),
      verify: (_) {
        verify(() => locationService.openLocationSettings()).called(1);
        verify(() => locationService.currentCoordinates()).called(1);
      },
    );
  });
}

Shift _shift() {
  return Shift(
    id: 'shift-id',
    title: 'Community Visit Shift',
    role: 'Care Assistant',
    typeOfShift: const <String>['Weekday'],
    user: 'Worker',
    startTime: DateTime.now().subtract(const Duration(minutes: 1)),
    finishTime: DateTime.now().add(const Duration(hours: 3)),
    numOfShiftsPerDay: 1,
    location: const Location(
      id: 'location-id',
      name: 'Demo Care Hub',
      coordinates: Coordinates(longitude: -2.2426, latitude: 53.4808),
    ),
    status: ShiftStatus.scheduled,
    date: DateTime.now(),
  );
}
