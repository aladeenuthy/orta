import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

import '../../shift_test_helpers.dart';

void main() {
  group('Shift', () {
    test('parses shift JSON', () {
      final Shift shift = Shift.fromJson(shiftJson());

      expect(shift.id, 'shift-id');
      expect(shift.title, 'Morning Care');
      expect(shift.role, 'Care Worker');
      expect(shift.typeOfShift, <String>['weekend']);
      expect(shift.user, '69edb6a277d24da71a004b3e');
      expect(shift.startTime, '0:44');
      expect(shift.finishTime, '4:17');
      expect(shift.numOfShiftsPerDay, 1);
      expect(shift.location.name, 'Main Office');
      expect(shift.location.address, '12 Worker Street');
      expect(shift.location.postCode, 'SW1A 1AA');
      expect(shift.location.coordinates.longitude, 180);
      expect(shift.location.coordinates.latitude, 90);
      expect(shift.date, DateTime.parse('2026-04-26T08:10:36.309Z'));
      expect(shift.status, 'active');
    });

    test('serializes shift JSON with API coordinates key', () {
      final Shift shift = shiftModel();

      expect(shift.toJson()['location'], <String, dynamic>{
        'name': 'Main Office',
        'address': '12 Worker Street',
        'postCode': 'SW1A 1AA',
        'cordinates': <String, dynamic>{'longitude': 180.0, 'latitude': 90.0},
      });
    });
  });
}
