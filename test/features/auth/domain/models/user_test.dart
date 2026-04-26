import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

void main() {
  group('User', () {
    test('parses register response user JSON', () {
      final User user = User.fromJson(<String, dynamic>{
        'id': '69edb6a277d24da71a004b3e',
        'name': 'Test Doe',
        'email': 'Test@example.com',
        'role': 'worker',
      });

      expect(user.id, '69edb6a277d24da71a004b3e');
      expect(user.name, 'Test Doe');
      expect(user.email, 'Test@example.com');
      expect(user.role, 'worker');
    });

    test('serializes to JSON', () {
      const User user = User(
        id: '69edb6a277d24da71a004b3e',
        name: 'Test Doe',
        email: 'Test@example.com',
        role: 'worker',
      );

      expect(user.toJson(), <String, dynamic>{
        'id': '69edb6a277d24da71a004b3e',
        'name': 'Test Doe',
        'email': 'Test@example.com',
        'role': 'worker',
      });
    });
  });
}
