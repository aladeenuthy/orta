import 'package:orta/features/features.dart';

class ShiftActionRules {
  const ShiftActionRules();
  static const Duration clockInLeadTime = Duration(minutes: 10);
  static const Duration clockOutLeadTime = Duration(hours: 2);

  ShiftActionEligibility evaluate({
    required Shift shift,
    required DateTime now,
    required LocationVerificationResult? locationVerification,
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

    final String? geoWarning = _geoWarning(
      locationVerification: locationVerification,
      locationWarning: locationWarning,
    );

    if (shift.status == ShiftStatus.inProgress) {
      return _clockOutEligibility(
        shift: shift,
        now: now,
        geoWarning: geoWarning,
        locationAction: locationAction,
        locationVerification: locationVerification,
      );
    }

    return _clockInEligibility(
      shift: shift,
      now: now,
      geoWarning: geoWarning,
      locationAction: locationAction,
      locationVerification: locationVerification,
    );
  }

  ShiftActionEligibility _clockInEligibility({
    required Shift shift,
    required DateTime now,
    required String? geoWarning,
    required ShiftLocationAction? locationAction,
    required LocationVerificationResult? locationVerification,
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
      isWithinWorkLocation: locationVerification?.withinRange,
      warningMessage: warningMessage,
      locationAction: locationAction,
      distanceInMeters: locationVerification?.distanceMeters.toDouble(),
    );
  }

  ShiftActionEligibility _clockOutEligibility({
    required Shift shift,
    required DateTime now,
    required String? geoWarning,
    required ShiftLocationAction? locationAction,
    required LocationVerificationResult? locationVerification,
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
      isWithinWorkLocation: locationVerification?.withinRange,
      warningMessage: warningMessage,
      locationAction: locationAction,
      distanceInMeters: locationVerification?.distanceMeters.toDouble(),
    );
  }

  String? _geoWarning({
    required LocationVerificationResult? locationVerification,
    required String? locationWarning,
  }) {
    if (locationWarning != null) {
      return locationWarning;
    }

    if (locationVerification == null) {
      return 'Unable to verify your current location';
    }

    if (!locationVerification.withinRange) {
      return 'You must be within ${locationVerification.radiusMeters}m of the work location';
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
