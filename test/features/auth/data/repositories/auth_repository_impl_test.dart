import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

void main() {
  late MockAuthRemoteDataSource remoteDataSource;
  late MockAuthLocalDataSource localDataSource;
  late AuthRepositoryImpl repository;

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
    remoteDataSource = MockAuthRemoteDataSource();
    localDataSource = MockAuthLocalDataSource();
    repository = AuthRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
    );
  });

  group('AuthRepositoryImpl.clearSession', () {
    test('delegates to local data source', () async {
      when(() => localDataSource.clearSession()).thenAnswer((_) async {});

      final Either<AppError, Unit> result = await repository.clearSession();

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(() => localDataSource.clearSession()).called(1);
    });

    test('returns AppError when clearing cached session fails', () async {
      when(
        () => localDataSource.clearSession(),
      ).thenThrow(Exception('Cache failed'));

      final Either<AppError, Unit> result = await repository.clearSession();

      expect(
        result,
        equals(
          const Left<AppError, Unit>(
            AppError('Something went wront! Please try again later.'),
          ),
        ),
      );
    });
  });

  group('AuthRepositoryImpl.getCachedSession', () {
    test('returns cached session from local data source', () async {
      when(
        () => localDataSource.getCachedSession(),
      ).thenAnswer((_) async => session);

      final Either<AppError, AuthSession?> result = await repository
          .getCachedSession();

      expect(result, equals(const Right<AppError, AuthSession?>(session)));
      verify(() => localDataSource.getCachedSession()).called(1);
    });

    test('returns null when no cached session exists', () async {
      when(
        () => localDataSource.getCachedSession(),
      ).thenAnswer((_) async => null);

      final Either<AppError, AuthSession?> result = await repository
          .getCachedSession();

      expect(result, equals(const Right<AppError, AuthSession?>(null)));
    });

    test('returns AppError when reading cached session fails', () async {
      when(
        () => localDataSource.getCachedSession(),
      ).thenThrow(Exception('Cache failed'));

      final Either<AppError, AuthSession?> result = await repository
          .getCachedSession();

      expect(
        result,
        equals(
          const Left<AppError, AuthSession?>(
            AppError('Something went wront! Please try again later.'),
          ),
        ),
      );
    });
  });

  group('AuthRepositoryImpl.getUser', () {
    test('delegates to remote data source and caches returned user', () async {
      const User user = User(
        id: '69edb6a277d24da71a004b3e',
        name: 'Test Doe',
        email: 'Test@example.com',
        role: 'worker',
      );
      when(
        () => remoteDataSource.getUser(),
      ).thenAnswer((_) async => const Right<AppError, User>(user));
      when(() => localDataSource.cacheUser(user)).thenAnswer((_) async {});

      final Either<AppError, User> result = await repository.getUser();

      expect(result, equals(const Right<AppError, User>(user)));
      verify(() => remoteDataSource.getUser()).called(1);
      verify(() => localDataSource.cacheUser(user)).called(1);
    });

    test('returns remote data source errors', () async {
      when(() => remoteDataSource.getUser()).thenAnswer(
        (_) async => const Left<AppError, User>(AppError('Unauthorized')),
      );

      final Either<AppError, User> result = await repository.getUser();

      expect(
        result,
        equals(const Left<AppError, User>(AppError('Unauthorized'))),
      );
      verifyNever(() => localDataSource.cacheUser(session.user));
    });

    test('returns AppError when caching returned user fails', () async {
      const User user = User(
        id: '69edb6a277d24da71a004b3e',
        name: 'Test Doe',
        email: 'Test@example.com',
        role: 'worker',
      );
      when(
        () => remoteDataSource.getUser(),
      ).thenAnswer((_) async => const Right<AppError, User>(user));
      when(
        () => localDataSource.cacheUser(user),
      ).thenThrow(Exception('Cache failed'));

      final Either<AppError, User> result = await repository.getUser();

      expect(
        result,
        equals(
          const Left<AppError, User>(
            AppError('Something went wront! Please try again later.'),
          ),
        ),
      );
    });
  });

  group('AuthRepositoryImpl.forgotPassword', () {
    test('delegates to remote data source', () async {
      when(
        () => remoteDataSource.forgotPassword(email: 'john@example.com'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await repository.forgotPassword(
        email: 'john@example.com',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(
        () => remoteDataSource.forgotPassword(email: 'john@example.com'),
      ).called(1);
    });

    test('returns remote data source errors', () async {
      when(
        () => remoteDataSource.forgotPassword(email: 'john@example.com'),
      ).thenAnswer(
        (_) async => const Left<AppError, Unit>(AppError('Email not found')),
      );

      final Either<AppError, Unit> result = await repository.forgotPassword(
        email: 'john@example.com',
      );

      expect(
        result,
        equals(const Left<AppError, Unit>(AppError('Email not found'))),
      );
    });
  });

  group('AuthRepositoryImpl.sendOtp', () {
    test('delegates to remote data source', () async {
      when(
        () => remoteDataSource.sendOtp(email: 'john@example.com'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await repository.sendOtp(
        email: 'john@example.com',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(
        () => remoteDataSource.sendOtp(email: 'john@example.com'),
      ).called(1);
    });
  });

  group('AuthRepositoryImpl.resendOtp', () {
    test('delegates to remote data source', () async {
      when(
        () => remoteDataSource.resendOtp(email: 'john@example.com'),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await repository.resendOtp(
        email: 'john@example.com',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(
        () => remoteDataSource.resendOtp(email: 'john@example.com'),
      ).called(1);
    });
  });

  group('AuthRepositoryImpl.login', () {
    test('delegates to remote data source and caches session', () async {
      when(
        () => remoteDataSource.login(
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
      ).thenAnswer((_) async => const Right<AppError, AuthSession>(session));
      when(
        () => localDataSource.cacheSession(session),
      ).thenAnswer((_) async {});

      final Either<AppError, AuthSession> result = await repository.login(
        email: 'john@example.com',
        password: 'StrongPass123!',
      );

      expect(result, equals(const Right<AppError, AuthSession>(session)));
      verify(
        () => remoteDataSource.login(
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
      ).called(1);
      verify(() => localDataSource.cacheSession(session)).called(1);
    });

    test('returns remote data source errors without caching', () async {
      when(
        () => remoteDataSource.login(
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
      ).thenAnswer(
        (_) async =>
            const Left<AppError, AuthSession>(AppError('Invalid credentials')),
      );

      final Either<AppError, AuthSession> result = await repository.login(
        email: 'john@example.com',
        password: 'StrongPass123!',
      );

      expect(
        result,
        equals(
          const Left<AppError, AuthSession>(AppError('Invalid credentials')),
        ),
      );
      verifyNever(() => localDataSource.cacheSession(session));
    });

    test('returns AppError when session caching fails', () async {
      when(
        () => remoteDataSource.login(
          email: 'john@example.com',
          password: 'StrongPass123!',
        ),
      ).thenAnswer((_) async => const Right<AppError, AuthSession>(session));
      when(
        () => localDataSource.cacheSession(session),
      ).thenThrow(Exception('Cache failed'));

      final Either<AppError, AuthSession> result = await repository.login(
        email: 'john@example.com',
        password: 'StrongPass123!',
      );

      expect(
        result,
        equals(
          const Left<AppError, AuthSession>(
            AppError('Something went wront! Please try again later.'),
          ),
        ),
      );
    });
  });

  group('AuthRepositoryImpl.register', () {
    test(
      'delegates to remote data source and caches returned session',
      () async {
        when(
          () => remoteDataSource.register(
            name: 'Test Doe',
            email: 'Test@example.com',
            password: 'Marine345@',
          ),
        ).thenAnswer((_) async => const Right<AppError, AuthSession>(session));
        when(
          () => localDataSource.cacheSession(session),
        ).thenAnswer((_) async {});

        final Either<AppError, AuthSession> result = await repository.register(
          name: 'Test Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        );

        expect(result, equals(const Right<AppError, AuthSession>(session)));
        verify(
          () => remoteDataSource.register(
            name: 'Test Doe',
            email: 'Test@example.com',
            password: 'Marine345@',
          ),
        ).called(1);
        verify(() => localDataSource.cacheSession(session)).called(1);
      },
    );

    test('returns remote data source errors', () async {
      when(
        () => remoteDataSource.register(
          name: 'Test Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        ),
      ).thenAnswer(
        (_) async =>
            const Left<AppError, AuthSession>(AppError('Email exists')),
      );

      final Either<AppError, AuthSession> result = await repository.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      );

      expect(
        result,
        equals(const Left<AppError, AuthSession>(AppError('Email exists'))),
      );
    });
  });

  group('AuthRepositoryImpl.verifyOtp', () {
    test(
      'delegates to remote data source and caches returned session',
      () async {
        const AuthSession verifiedSession = AuthSession(
          token: 'verified-token',
          user: User(
            id: '69edb6a277d24da71a004b3e',
            name: 'Test Doe',
            email: 'Test@example.com',
            role: 'worker',
            isEmailVerified: true,
          ),
        );
        when(
          () => remoteDataSource.verifyOtp(
            email: 'Test@example.com',
            otp: '123456',
          ),
        ).thenAnswer(
          (_) async => const Right<AppError, AuthSession>(verifiedSession),
        );
        when(
          () => localDataSource.cacheSession(verifiedSession),
        ).thenAnswer((_) async {});

        final Either<AppError, AuthSession> result = await repository.verifyOtp(
          email: 'Test@example.com',
          otp: '123456',
        );

        expect(
          result,
          equals(const Right<AppError, AuthSession>(verifiedSession)),
        );
        verify(
          () => remoteDataSource.verifyOtp(
            email: 'Test@example.com',
            otp: '123456',
          ),
        ).called(1);
        verify(() => localDataSource.cacheSession(verifiedSession)).called(1);
      },
    );

    test('returns remote data source errors without caching', () async {
      when(
        () => remoteDataSource.verifyOtp(
          email: 'Test@example.com',
          otp: '123456',
        ),
      ).thenAnswer(
        (_) async => const Left<AppError, AuthSession>(AppError('Invalid OTP')),
      );

      final Either<AppError, AuthSession> result = await repository.verifyOtp(
        email: 'Test@example.com',
        otp: '123456',
      );

      expect(
        result,
        equals(const Left<AppError, AuthSession>(AppError('Invalid OTP'))),
      );
      verifyNever(() => localDataSource.cacheSession(session));
    });
  });

  group('AuthRepositoryImpl.resetPassword', () {
    test('delegates to remote data source', () async {
      when(
        () => remoteDataSource.resetPassword(
          userId: 'user-id',
          resetToken: 'reset-token',
          newPassword: 'NewPass123!',
        ),
      ).thenAnswer((_) async => const Right<AppError, Unit>(unit));

      final Either<AppError, Unit> result = await repository.resetPassword(
        userId: 'user-id',
        resetToken: 'reset-token',
        newPassword: 'NewPass123!',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      verify(
        () => remoteDataSource.resetPassword(
          userId: 'user-id',
          resetToken: 'reset-token',
          newPassword: 'NewPass123!',
        ),
      ).called(1);
    });

    test('returns remote data source errors', () async {
      when(
        () => remoteDataSource.resetPassword(
          userId: 'user-id',
          resetToken: 'reset-token',
          newPassword: 'NewPass123!',
        ),
      ).thenAnswer(
        (_) async => const Left<AppError, Unit>(AppError('Invalid token')),
      );

      final Either<AppError, Unit> result = await repository.resetPassword(
        userId: 'user-id',
        resetToken: 'reset-token',
        newPassword: 'NewPass123!',
      );

      expect(
        result,
        equals(const Left<AppError, Unit>(AppError('Invalid token'))),
      );
    });
  });
}
