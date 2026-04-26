import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

class MockAuthRemoteDataSource extends AuthRemoteDataSource {
  MockAuthRemoteDataSource() : super(api: Api());

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
  group('AuthRepositoryImpl.register', () {
    test('delegates to remote data source', () async {
      final MockAuthRemoteDataSource remoteDataSource =
          MockAuthRemoteDataSource();
      final AuthRepositoryImpl repository = AuthRepositoryImpl(
        remoteDataSource: remoteDataSource,
      );

      final Either<AppError, Unit> result = await repository.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      );

      expect(result, equals(const Right<AppError, Unit>(unit)));
      expect(remoteDataSource.name, 'Test Doe');
      expect(remoteDataSource.email, 'Test@example.com');
      expect(remoteDataSource.password, 'Marine345@');
    });

    test('returns remote data source errors', () async {
      final MockAuthRemoteDataSource remoteDataSource =
          MockAuthRemoteDataSource()
            ..response = const Left<AppError, Unit>(AppError('Email exists'));
      final AuthRepositoryImpl repository = AuthRepositoryImpl(
        remoteDataSource: remoteDataSource,
      );

      final Either<AppError, Unit> result = await repository.register(
        name: 'Test Doe',
        email: 'Test@example.com',
        password: 'Marine345@',
      );

      expect(
        result,
        equals(const Left<AppError, Unit>(AppError('Email exists'))),
      );
    });
  });
}
