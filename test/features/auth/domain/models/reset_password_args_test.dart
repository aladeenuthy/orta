import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  group('ResetPasswordArgs.fromUri', () {
    test('parses user id and reset token from deep link query parameters', () {
      final ResetPasswordArgs? args = ResetPasswordArgs.fromUri(
        Uri.parse(
          'shiftmanager://reset-password?id=user-id&resetToken=reset-token',
        ),
      );

      expect(args, isNotNull);
      expect(args?.userId, 'user-id');
      expect(args?.resetToken, 'reset-token');
    });

    test('returns null when user id is missing', () {
      final ResetPasswordArgs? args = ResetPasswordArgs.fromUri(
        Uri.parse('shiftmanager://reset-password?resetToken=reset-token'),
      );

      expect(args, isNull);
    });

    test('returns null when reset token is missing', () {
      final ResetPasswordArgs? args = ResetPasswordArgs.fromUri(
        Uri.parse('shiftmanager://reset-password?id=user-id'),
      );

      expect(args, isNull);
    });
  });
}
