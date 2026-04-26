import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

class MockAuthRepository implements AuthRepository {
  String? name;
  String? email;
  String? password;
  Either<AppError, Unit> response = const Right<AppError, Unit>(unit);

  @override
  Future<Either<AppError, Unit>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    this.name = name;
    this.email = email;
    this.password = password;
    return response;
  }
}

void main() {
  group('AuthService.register', () {
    test('delegates registration to repository', () async {
      final MockAuthRepository repository = MockAuthRepository();
      final AuthService service = AuthService(repository: repository);

      final Either<AppError, Unit> result = await service.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      expect(repository.name, 'Test Doe');
      expect(repository.email, 'Test@example.com');
      expect(repository.password, 'Marine345@');
    });

    test('returns repository errors', () async {
      final MockAuthRepository repository = MockAuthRepository()
        ..response = const Left<AppError, Unit>(AppError('Invalid email'));
      final AuthService service = AuthService(repository: repository);

      final Either<AppError, Unit> result = await service.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      );

      expect(
        result,
        equals(const Left<AppError, Unit>(AppError('Invalid email'))),
      );
    });
  });
}
