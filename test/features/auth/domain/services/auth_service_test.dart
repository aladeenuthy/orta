import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late AuthService service;

  const AuthSession session = AuthSession(
    token: 'token',
    user: User(
      id: '69edb6a277d24da71a004b3e',
      name: 'Test Doe',
      email: 'Test@example.com',
      role: 'worker',
    ),
  );

  setUp(() {
    repository = MockAuthRepository();
    service = AuthService(repository: repository);
  });

  group('AuthService.getUser', () {
    test('delegates current user fetch to repository', () async {
      const User user = User(
        id: '69edb6a277d24da71a004b3e',
        name: 'Test Doe',
        email: 'Test@example.com',
        role: 'worker',
      );
      when(
        () => repository.getUser(),
      ).thenAnswer((_) async => const Right<AppError, User>(user));

      final Either<AppError, User> result = await service.getUser();

      expect(result, equals(const Right<AppError, User>(user)));
      verify(() => repository.getUser()).called(1);
    });

    test('returns repository errors', () async {
      when(() => repository.getUser()).thenAnswer(
        (_) async => const Left<AppError, User>(AppError('Unauthorized')),
      );

      final Either<AppError, User> result = await service.getUser();

      expect(
        result,
        equals(const Left<AppError, User>(AppError('Unauthorized'))),
      );
    });
  });

  group('AuthService.forgotPassword', () {
    test('delegates forgot password to repository', () async {
      when(
        () => repository.forgotPassword(email: 'john@example.com'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await service.forgotPassword(
        email: 'john@example.com',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(
        () => repository.forgotPassword(email: 'john@example.com'),
      ).called(1);
    });

    test('returns repository errors', () async {
      when(
        () => repository.forgotPassword(email: 'john@example.com'),
      ).thenAnswer(
        (_) async => const Left<AppError, Unit>(AppError('Email not found')),
      );

      final Either<AppError, Unit> result = await service.forgotPassword(
        email: 'john@example.com',
      );

      expect(
        result,
        equals(const Left<AppError, Unit>(AppError('Email not found'))),
      );
    });
  });

  group('AuthService.login', () {
    test('delegates login to repository', () async {
      when(
        () => repository.login(
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
      ).thenAnswer((_) async => const Right<AppError, AuthSession>(session));

      final Either<AppError, AuthSession> result = await service.login(
        email: 'john@example.com',
        password: 'StrongPass123!',
      );

      expect(result, equals(const Right<AppError, AuthSession>(session)));
      verify(
        () => repository.login(
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
      ).called(1);
    });

    test('returns repository errors', () async {
      when(
        () => repository.login(
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
      ).thenAnswer(
        (_) async =>
            const Left<AppError, AuthSession>(AppError('Invalid credentials')),
      );

      final Either<AppError, AuthSession> result = await service.login(
        email: 'john@example.com',
        password: 'StrongPass123!',
      );

      expect(
        result,
        equals(
          const Left<AppError, AuthSession>(AppError('Invalid credentials')),
        ),
      );
    });
  });

  group('AuthService.register', () {
    test('delegates registration to repository', () async {
      when(
        () => repository.register(
          name: 'Test Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        ),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await service.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(
        () => repository.register(
          name: 'Test Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        ),
      ).called(1);
    });

    test('returns repository errors', () async {
      when(
        () => repository.register(
          name: 'Test Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        ),
      ).thenAnswer(
        (_) async => const Left<AppError, Unit>(AppError('Invalid email')),
      );

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

  group('AuthService.resetPassword', () {
    test(
      'delegates reset password to repository when passwords match',
      () async {
        when(
          () => repository.resetPassword(
            userId: 'user-id',
            resetToken: 'reset-token',
            newPassword: 'NewPass123!',
          ),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

        final Either<AppError, Unit> result = await service.resetPassword(
          userId: 'user-id',
          resetToken: 'reset-token',
          newPassword: 'NewPass123!',
          confirmPassword: 'NewPass123!',
        );

        expect(result, equals(const Right<AppError, Unit>(unit)));
        verify(
          () => repository.resetPassword(
            userId: 'user-id',
            resetToken: 'reset-token',
            newPassword: 'NewPass123!',
          ),
        ).called(1);
      },
    );

    test('returns AppError when passwords do not match', () async {
      final Either<AppError, Unit> result = await service.resetPassword(
        userId: 'user-id',
        resetToken: 'reset-token',
        newPassword: 'NewPass123!',
        confirmPassword: 'DifferentPass123!',
      );

      expect(
        result,
        equals(const Left<AppError, Unit>(AppError('Passwords do not match'))),
      );
      verifyNever(
        () => repository.resetPassword(
          userId: any(named: 'userId'),
          resetToken: any(named: 'resetToken'),
          newPassword: any(named: 'newPassword'),
        ),
      );
    });

    test('returns repository errors', () async {
      when(
        () => repository.resetPassword(
          userId: 'user-id',
          resetToken: 'reset-token',
          newPassword: 'NewPass123!',
        ),
      ).thenAnswer(
        (_) async => const Left<AppError, Unit>(AppError('Invalid token')),
      );

      final Either<AppError, Unit> result = await service.resetPassword(
        userId: 'user-id',
        resetToken: 'reset-token',
        newPassword: 'NewPass123!',
        confirmPassword: 'NewPass123!',
      );

      expect(
        result,
        equals(const Left<AppError, Unit>(AppError('Invalid token'))),
      );
    });
  });
}
