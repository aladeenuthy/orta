import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:orta/features/features.dart';

abstract class LocationService {
  Future<Either<AppError, Coordinates>> currentCoordinates();
  Future<bool> openAppSettings();
  Future<bool> openLocationSettings();
}

class GeolocatorLocationService implements LocationService {
  static const String serviceDisabledMessage =
      'Location is disabled. Enable location to clock in or clock out.';
  static const String permissionRequiredMessage =
      'Location permission is required to clock in or clock out.';
  static const String permissionDeniedForeverMessage =
      'Location permission is disabled. Enable it in settings to clock in or clock out.';
  static const String locationUnavailableMessage =
      'Unable to verify your current location.';

  @override
  Future<Either<AppError, Coordinates>> currentCoordinates() async {
    try {
      final bool enabled = await Geolocator.isLocationServiceEnabled();
      if (!enabled) {
        return left(const AppError(serviceDisabledMessage));
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        return left(const AppError(permissionRequiredMessage));
      }

      if (permission == LocationPermission.deniedForever) {
        return left(const AppError(permissionDeniedForeverMessage));
      }

      final Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      return right(
        Coordinates(longitude: position.longitude, latitude: position.latitude),
      );
    } catch (_) {
      return left(const AppError(locationUnavailableMessage));
    }
  }

  @override
  Future<bool> openAppSettings() {
    return Geolocator.openAppSettings();
  }

  @override
  Future<bool> openLocationSettings() {
    return Geolocator.openLocationSettings();
  }
}
