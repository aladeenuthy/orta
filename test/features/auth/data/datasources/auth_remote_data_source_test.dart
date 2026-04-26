import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

class MockApi extends Mock implements Api {}

void main() {
  late MockApi api;
  late AuthRemoteDataSource dataSource;

  Response<dynamic> authResponse(String path) {
    return Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      data: <String, dynamic>{
        'token': 'token',
        'user': <String, dynamic>{
          'id': '69edb6a277d24da71a004b3e',
          'name': 'Test Doe',
          'email': 'Test@example.com',
          'role': 'worker',
        },
      },
    );
  }

  setUp(() {
    api = MockApi();
    dataSource = AuthRemoteDataSource(api: api);
  });

  group('AuthRemoteDataSource.forgotPassword', () {
    test(
      'posts forgot password payload and ignores successful response body',
      () async {
        when(
          () => api.post(
            Endpoints.forgotPassword,
            data: <String, dynamic>{'email': 'john@example.com'},
          ),
        ).thenAnswer((_) async => authResponse(Endpoints.forgotPassword));

        final Either<AppError, Unit> result = await dataSource.forgotPassword(
          email: 'john@example.com',
        );

        expect(result, equals(const Right<AppError, Unit>(unit)));
        verify(
          () => api.post(
            Endpoints.forgotPassword,
            data: <String, dynamic>{'email': 'john@example.com'},
          ),
        ).called(1);
      },
    );

    test('returns AppError when the API request fails', () async {
      when(
        () => api.post(
          Endpoints.forgotPassword,
          data: <String, dynamic>{'email': 'john@example.com'},
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.forgotPassword),
          message: 'Server error',
        ),
      );

      final Either<AppError, Unit> result = await dataSource.forgotPassword(
        email: 'john@example.com',
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (AppError error) => expect(error.message, isNotEmpty),
        (_) => fail('Expected AppError'),
      );
    });
  });

  group('AuthRemoteDataSource.login', () {
    test('posts login payload and parses the auth session', () async {
      when(
        () => api.post(
          Endpoints.login,
          data: <String, dynamic>{
            'email': 'john@example.com',
            'password': 'StrongPass123!',
          },
        ),
      ).thenAnswer((_) async => authResponse(Endpoints.login));

      final Either<AppError, AuthSession> result = await dataSource.login(
        email: 'john@example.com',
        password: 'StrongPass123!',
      );

      verify(
        () => api.post(
          Endpoints.login,
          data: <String, dynamic>{
            'email': 'john@example.com',
            'password': 'StrongPass123!',
          },
        ),
      ).called(1);
      result.fold(
        (AppError error) => fail('Expected auth session, got $error'),
        (AuthSession session) {
          expect(session.token, 'token');
          expect(session.user.id, '69edb6a277d24da71a004b3e');
          expect(session.user.name, 'Test Doe');
          expect(session.user.email, 'Test@example.com');
          expect(session.user.role, 'worker');
        },
      );
    });

    test('returns AppError when the API request fails', () async {
      when(
        () => api.post(
          Endpoints.login,
          data: <String, dynamic>{
            'email': 'john@example.com',
            'password': 'StrongPass123!',
          },
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.login),
          message: 'Server error',
        ),
      );

      final Either<AppError, AuthSession> result = await dataSource.login(
        email: 'john@example.com',
        password: 'StrongPass123!',
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (AppError error) => expect(error.message, isNotEmpty),
        (_) => fail('Expected AppError'),
      );
    });
  });

  group('AuthRemoteDataSource.register', () {
    test(
      'posts register payload and ignores successful response body',
      () async {
        when(
          () => api.post(
            Endpoints.register,
            data: <String, dynamic>{
              'name': 'Test Doe',
              'email': 'Test@example.com',
              'password': 'Marine345@',
            },
          ),
        ).thenAnswer((_) async => authResponse(Endpoints.register));

        final Either<AppError, Unit> result = await dataSource.register(
          name: 'Test Doe',
          email: 'Test@example.com',
          password: 'Marine345@',
        );

        expect(result, equals(const Right<AppError, Unit>(unit)));
        verify(
          () => api.post(
            Endpoints.register,
            data: <String, dynamic>{
              'name': 'Test Doe',
              'email': 'Test@example.com',
              'password': 'Marine345@',
            },
          ),
        ).called(1);
      },
    );

    test('returns AppError when the API request fails', () async {
      when(
        () => api.post(
          Endpoints.register,
          data: <String, dynamic>{
            'name': 'Test Doe',
            'email': 'Test@example.com',
            'password': 'Marine345@',
          },
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.register),
          message: 'Server error',
        ),
      );

      final Either<AppError, Unit> result = await dataSource.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (AppError error) => expect(error.message, isNotEmpty),
        (_) => fail('Expected AppError'),
      );
    });
  });

  group('AuthRemoteDataSource.resetPassword', () {
    test(
      'posts reset password payload and ignores successful response body',
      () async {
        when(
          () => api.post(
            Endpoints.resetPassword,
            data: <String, dynamic>{
              'id': 'user-id',
              'resetToken': 'reset-token',
              'newPassword': 'NewPass123!',
            },
          ),
        ).thenAnswer((_) async => authResponse(Endpoints.resetPassword));

        final Either<AppError, Unit> result = await dataSource.resetPassword(
          userId: 'user-id',
          resetToken: 'reset-token',
          newPassword: 'NewPass123!',
        );

        expect(result, equals(const Right<AppError, Unit>(unit)));
        verify(
          () => api.post(
            Endpoints.resetPassword,
            data: <String, dynamic>{
              'id': 'user-id',
              'resetToken': 'reset-token',
              'newPassword': 'NewPass123!',
            },
          ),
        ).called(1);
      },
    );

    test('returns AppError when the API request fails', () async {
      when(
        () => api.post(
          Endpoints.resetPassword,
          data: <String, dynamic>{
            'id': 'user-id',
            'resetToken': 'reset-token',
            'newPassword': 'NewPass123!',
          },
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: Endpoints.resetPassword),
          message: 'Server error',
        ),
      );

      final Either<AppError, Unit> result = await dataSource.resetPassword(
        userId: 'user-id',
        resetToken: 'reset-token',
        newPassword: 'NewPass123!',
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (AppError error) => expect(error.message, isNotEmpty),
        (_) => fail('Expected AppError'),
      );
    });
  });
}
