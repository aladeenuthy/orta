import 'package:geolocator/geolocator.dart';
import 'package:orta/features/features.dart';

class ShiftActionRules {
  const ShiftActionRules();
  static const Duration clockInLeadTime = Duration(minutes: 10);
  static const Duration clockOutLeadTime = Duration(hours: 2);
  static const double geofenceRadiusMeters = 200;

  ShiftActionEligibility evaluate({
    required Shift shift,
    required DateTime now,
    required Coordinates? workerCoordinates,
    String? locationWarning,
    ShiftLocationAction? locationAction,
  }) {
    if (shift.status == ShiftStatus.completed) {
      return const ShiftActionEligibility(
        action: ShiftPrimaryActionType.completed,
        enabled: false,
        label: 'Shift Completed',
      );
    }

    if (shift.status == ShiftStatus.cancelled) {
      return const ShiftActionEligibility(
        action: ShiftPrimaryActionType.cancelled,
        enabled: false,
        label: 'Shift Cancelled',
      );
    }

    final double? distanceInMeters = workerCoordinates == null
        ? null
        : distanceBetween(
            workerCoordinates.latitude,
            workerCoordinates.longitude,
            shift.location.coordinates.latitude,
            shift.location.coordinates.longitude,
          );
    final bool? isWithinWorkLocation = distanceInMeters == null
        ? null
        : distanceInMeters <= geofenceRadiusMeters;
    final String? geoWarning = _geoWarning(
      distanceInMeters: distanceInMeters,
      locationWarning: locationWarning,
    );

    if (shift.status == ShiftStatus.inProgress) {
      return _clockOutEligibility(
        shift: shift,
        now: now,
        geoWarning: geoWarning,
        locationAction: locationAction,
        distanceInMeters: distanceInMeters,
        isWithinWorkLocation: isWithinWorkLocation,
      );
    }

    return _clockInEligibility(
      shift: shift,
      now: now,
      geoWarning: geoWarning,
      locationAction: locationAction,
      distanceInMeters: distanceInMeters,
      isWithinWorkLocation: isWithinWorkLocation,
    );
  }

  double distanceBetween(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    // Uses Haversine formula via Geolocator package to calculate distance between two coordinates
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }

  ShiftActionEligibility _clockInEligibility({
    required Shift shift,
    required DateTime now,
    required String? geoWarning,
    required ShiftLocationAction? locationAction,
    required double? distanceInMeters,
    required bool? isWithinWorkLocation,
  }) {
    final DateTime start = _combineDateAndTime(shift.date, shift.startTime);
    final DateTime opensAt = start.subtract(clockInLeadTime);
    final bool isTooEarly = now.isBefore(opensAt);
    final String? warningMessage =
        geoWarning ??
        (isTooEarly
            ? 'Clock in opens at ${DateUtils.twelveHourTime(opensAt)}'
            : null);

    return ShiftActionEligibility(
      action: ShiftPrimaryActionType.clockIn,
      enabled: warningMessage == null,
      label: 'Clock In',
      isWithinWorkLocation: isWithinWorkLocation,
      warningMessage: warningMessage,
      locationAction: locationAction,
      distanceInMeters: distanceInMeters,
    );
  }

  ShiftActionEligibility _clockOutEligibility({
    required Shift shift,
    required DateTime now,
    required String? geoWarning,
    required ShiftLocationAction? locationAction,
    required double? distanceInMeters,
    required bool? isWithinWorkLocation,
  }) {
    final DateTime start = _combineDateAndTime(shift.date, shift.startTime);
    final DateTime baseFinish = _combineDateAndTime(
      shift.date,
      shift.finishTime,
    );
    final DateTime finish = baseFinish.isBefore(start)
        ? baseFinish.add(const Duration(days: 1))
        : baseFinish;
    final DateTime opensAt = finish.subtract(clockOutLeadTime);
    final bool isTooEarly = now.isBefore(opensAt);
    final String? warningMessage =
        geoWarning ??
        (isTooEarly
            ? 'Clock out opens at ${DateUtils.twelveHourTime(opensAt)}'
            : null);

    return ShiftActionEligibility(
      action: ShiftPrimaryActionType.clockOut,
      enabled: warningMessage == null,
      label: 'Clock Out',
      isWithinWorkLocation: isWithinWorkLocation,
      warningMessage: warningMessage,
      locationAction: locationAction,
      distanceInMeters: distanceInMeters,
    );
  }

  String? _geoWarning({
    required double? distanceInMeters,
    required String? locationWarning,
  }) {
    if (locationWarning != null) {
      return locationWarning;
    }

    if (distanceInMeters == null) {
      return 'Unable to verify your current location';
    }

    if (distanceInMeters > geofenceRadiusMeters) {
      return 'You must be within 200m of the work location';
    }

    return null;
  }

  DateTime _combineDateAndTime(DateTime date, DateTime time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
      time.second,
      time.millisecond,
      time.microsecond,
    );
  }
}
