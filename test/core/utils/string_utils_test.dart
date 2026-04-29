import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  group('StringUtils.initials', () {
    test('returns first and last initials', () {
      expect(StringUtils.initials('Abdulmalik Uthman'), 'AU');
    });

    test('returns fallback for empty names', () {
      expect(StringUtils.initials(''), 'AA');
    });
  });
}
