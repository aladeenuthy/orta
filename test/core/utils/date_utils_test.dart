import 'package:flutter_test/flutter_test.dart';
import 'package:orta/core/utils/date_utils.dart' as app;

void main() {
  group('DateUtils', () {
    test('formats a shift date with a twelve hour time', () {
      final String formatted = app.DateUtils.shiftDateTime(
        DateTime(2026, 4, 25),
        DateTime(1970, 1, 1, 22),
      );

      expect(formatted, 'April 25, 2026, 10:00 PM');
    });

    test('formats a twenty four hour time range', () {
      final String formatted = app.DateUtils.twentyFourHourRange(
        DateTime(1970, 1, 1, 9),
        DateTime(1970, 1, 1, 17),
      );

      expect(formatted, '09:00-17:00');
    });

    test('formats duration in hours without trailing decimals', () {
      final String formatted = app.DateUtils.durationInHours(
        DateTime(1970, 1, 1, 13),
        DateTime(1970, 1, 1, 19),
      );

      expect(formatted, '6 hours');
    });

    test('formats overnight duration in hours', () {
      final String formatted = app.DateUtils.durationInHours(
        DateTime(1970, 1, 1, 22),
        DateTime(1970, 1, 1, 2, 30),
      );

      expect(formatted, '4.5 hours');
    });
  });
}
