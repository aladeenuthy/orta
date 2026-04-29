import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  const ShiftActionRules rules = ShiftActionRules();
  const LocationVerificationResult withinRange = LocationVerificationResult(
    withinRange: true,
    distanceMeters: 12,
    radiusMeters: 200,
  );
  const LocationVerificationResult outsideRange = LocationVerificationResult(
    withinRange: false,
    distanceMeters: 850,
    radiusMeters: 200,
  );

  group('ShiftActionRules', () {
    test('disables clock in before the ten minute opening window', () {
      final ShiftActionEligibility eligibility = rules.evaluate(
        shift: _shift(status: ShiftStatus.scheduled, startHour: 13),
        now: DateTime(2026, 5, 5, 12, 49),
        locationVerification: withinRange,
      );

      expect(eligibility.action, ShiftPrimaryActionType.clockIn);
      expect(eligibility.enabled, isFalse);
      expect(eligibility.warningMessage, 'Clock in opens at 12:50 PM');
    });

    test('disables clock in when the shift date is still in the future', () {
      final ShiftActionEligibility eligibility = rules.evaluate(
        shift: _shift(
          status: ShiftStatus.scheduled,
          date: DateTime(2026, 5, 10),
          startHour: 8,
        ),
        now: DateTime(2026, 4, 28, 8),
        locationVerification: withinRange,
      );

      expect(eligibility.action, ShiftPrimaryActionType.clockIn);
      expect(eligibility.enabled, isFalse);
      expect(eligibility.warningMessage, 'Clock in opens at 7:50 AM');
    });

    test('enables clock in once the worker is within time and location', () {
      final ShiftActionEligibility eligibility = rules.evaluate(
        shift: _shift(status: ShiftStatus.scheduled, startHour: 13),
        now: DateTime(2026, 5, 5, 12, 50),
        locationVerification: withinRange,
      );

      expect(eligibility.action, ShiftPrimaryActionType.clockIn);
      expect(eligibility.enabled, isTrue);
      expect(eligibility.isWithinWorkLocation, isTrue);
      expect(eligibility.warningMessage, isNull);
    });

    test('disables clock in when worker is outside the geofence', () {
      final ShiftActionEligibility eligibility = rules.evaluate(
        shift: _shift(status: ShiftStatus.scheduled, startHour: 13),
        now: DateTime(2026, 5, 5, 13),
        locationVerification: outsideRange,
      );

      expect(eligibility.enabled, isFalse);
      expect(eligibility.isWithinWorkLocation, isFalse);
      expect(
        eligibility.warningMessage,
        'You must be within 200m of the work location',
      );
    });

    test('disables clock out before the two hour opening window', () {
      final ShiftActionEligibility eligibility = rules.evaluate(
        shift: _shift(status: ShiftStatus.inProgress, finishHour: 19),
        now: DateTime(2026, 5, 5, 16, 59),
        locationVerification: withinRange,
      );

      expect(eligibility.action, ShiftPrimaryActionType.clockOut);
      expect(eligibility.enabled, isFalse);
      expect(eligibility.warningMessage, 'Clock out opens at 5:00 PM');
    });

    test(
      'enables clock out for an in progress shift after the opening window',
      () {
        final ShiftActionEligibility eligibility = rules.evaluate(
          shift: _shift(status: ShiftStatus.inProgress, finishHour: 19),
          now: DateTime(2026, 5, 5, 17),
          locationVerification: withinRange,
        );

        expect(eligibility.action, ShiftPrimaryActionType.clockOut);
        expect(eligibility.enabled, isTrue);
        expect(eligibility.warningMessage, isNull);
      },
    );

    test('returns a completed disabled action for completed shifts', () {
      final ShiftActionEligibility eligibility = rules.evaluate(
        shift: _shift(status: ShiftStatus.completed),
        now: DateTime(2026, 5, 5, 17),
        locationVerification: withinRange,
      );

      expect(eligibility.action, ShiftPrimaryActionType.completed);
      expect(eligibility.enabled, isFalse);
      expect(eligibility.label, 'Shift Completed');
    });

    test('returns a cancelled disabled action for cancelled shifts', () {
      final ShiftActionEligibility eligibility = rules.evaluate(
        shift: _shift(status: ShiftStatus.cancelled),
        now: DateTime(2026, 5, 5, 17),
        locationVerification: withinRange,
      );

      expect(eligibility.action, ShiftPrimaryActionType.cancelled);
      expect(eligibility.enabled, isFalse);
      expect(eligibility.label, 'Shift Cancelled');
    });

    test('uses next day finish time for overnight clock out windows', () {
      final ShiftActionEligibility eligibility = rules.evaluate(
        shift: _shift(
          status: ShiftStatus.inProgress,
          startHour: 22,
          finishHour: 2,
        ),
        now: DateTime(2026, 5, 6),
        locationVerification: withinRange,
      );

      expect(eligibility.action, ShiftPrimaryActionType.clockOut);
      expect(eligibility.enabled, isTrue);
    });
  });
}

Shift _shift({
  ShiftStatus status = ShiftStatus.scheduled,
  DateTime? date,
  int startHour = 13,
  int finishHour = 19,
}) {
  return Shift(
    id: 'shift-id',
    title: 'Community Visit Shift',
    role: 'Care Assistant',
    typeOfShift: const <ShiftType>[ShiftType.weekday],
    user: 'Worker',
    startTime: DateTime(1970, 1, 1, startHour),
    finishTime: DateTime(1970, 1, 1, finishHour),
    numOfShiftsPerDay: 1,
    location: const Location(
      id: 'location-id',
      name: 'Demo Care Hub',
      coordinates: Coordinates(longitude: -2.2426, latitude: 53.4808),
    ),
    status: status,
    date: date ?? DateTime(2026, 5, 5),
  );
}
