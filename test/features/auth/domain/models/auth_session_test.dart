import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  group('AuthSession', () {
    test('parses login response JSON', () {
      final AuthSession session = AuthSession.fromJson(<String, dynamic>{
        'token': 'token',
        'user': <String, dynamic>{
          'id': '69edb6a277d24da71a004b3e',
          'name': 'Test Doe',
          'email': 'Test@example.com',
          'role': 'worker',
        },
      });

      expect(session.token, 'token');
      expect(session.user.id, '69edb6a277d24da71a004b3e');
      expect(session.user.name, 'Test Doe');
      expect(session.user.email, 'Test@example.com');
      expect(session.user.role, 'worker');
    });

    test('serializes to JSON', () {
      const AuthSession session = AuthSession(
        token: 'token',
        user: User(
          id: '69edb6a277d24da71a004b3e',
          name: 'Test Doe',
          email: 'Test@example.com',
          role: 'worker',
        ),
      );

      expect(session.toJson(), <String, dynamic>{
        'token': 'token',
        'user': <String, dynamic>{
          'id': '69edb6a277d24da71a004b3e',
          'name': 'Test Doe',
          'email': 'Test@example.com',
          'role': 'worker',
        },
      });
    });
  });
}
