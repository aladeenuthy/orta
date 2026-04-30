import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  late GeolocatorPlatform originalPlatform;
  late MockGeolocatorPlatform platform;
  late GeolocatorLocationService service;

  setUp(() {
    originalPlatform = GeolocatorPlatform.instance;
    platform = MockGeolocatorPlatform();
    GeolocatorPlatform.instance = platform;
    service = GeolocatorLocationService();
  });

  tearDown(() {
    GeolocatorPlatform.instance = originalPlatform;
  });

  group('GeolocatorLocationService', () {
    test('returns current coordinates when permission is available', () async {
      final Either<AppError, Coordinates> result = await service
          .currentCoordinates();

      result.fold(
        (AppError error) => fail('Expected coordinates, got $error'),
        (Coordinates coordinates) {
          expect(coordinates.latitude, 53.4808);
          expect(coordinates.longitude, -2.2426);
        },
      );
    });

    test('requests permission when initially denied', () async {
      platform.permission = LocationPermission.denied;
      platform.requestedPermission = LocationPermission.whileInUse;

      final Either<AppError, Coordinates> result = await service
          .currentCoordinates();

      expect(result.isRight(), isTrue);
      expect(platform.didRequestPermission, isTrue);
    });

    test('returns AppError when location service is disabled', () async {
      platform.locationServiceEnabled = false;

      final Either<AppError, Coordinates> result = await service
          .currentCoordinates();

      result.fold(
        (AppError error) => expect(
          error.message,
          GeolocatorLocationService.serviceDisabledMessage,
        ),
        (_) => fail('Expected AppError'),
      );
    });

    test('returns AppError when permission is denied forever', () async {
      platform.permission = LocationPermission.deniedForever;

      final Either<AppError, Coordinates> result = await service
          .currentCoordinates();

      result.fold(
        (AppError error) => expect(
          error.message,
          GeolocatorLocationService.permissionDeniedForeverMessage,
        ),
        (_) => fail('Expected AppError'),
      );
    });

    test('returns AppError when geolocator throws', () async {
      platform.throwOnPosition = true;

      final Either<AppError, Coordinates> result = await service
          .currentCoordinates();

      result.fold(
        (AppError error) => expect(
          error.message,
          GeolocatorLocationService.locationUnavailableMessage,
        ),
        (_) => fail('Expected AppError'),
      );
    });

    test('opens app settings', () async {
      final bool result = await service.openAppSettings();

      expect(result, isTrue);
      expect(platform.didOpenAppSettings, isTrue);
    });

    test('opens location settings', () async {
      final bool result = await service.openLocationSettings();

      expect(result, isTrue);
      expect(platform.didOpenLocationSettings, isTrue);
    });
  });
}

class MockGeolocatorPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements GeolocatorPlatform {
  bool locationServiceEnabled = true;
  bool didRequestPermission = false;
  bool didOpenAppSettings = false;
  bool didOpenLocationSettings = false;
  bool throwOnPosition = false;
  LocationPermission permission = LocationPermission.whileInUse;
  LocationPermission requestedPermission = LocationPermission.whileInUse;

  @override
  Future<bool> isLocationServiceEnabled() async {
    return locationServiceEnabled;
  }

  @override
  Future<LocationPermission> checkPermission() async {
    return permission;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    didRequestPermission = true;
    return requestedPermission;
  }

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) async {
    if (throwOnPosition) {
      throw Exception('Position unavailable');
    }

    return Position(
      longitude: -2.2426,
      latitude: 53.4808,
      timestamp: DateTime(2026, 5, 5),
      accuracy: 5,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0,
    );
  }

  @override
  Future<bool> openAppSettings() async {
    didOpenAppSettings = true;
    return true;
  }

  @override
  Future<bool> openLocationSettings() async {
    didOpenLocationSettings = true;
    return true;
  }
}
