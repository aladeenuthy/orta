import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<AppError, AuthSession>> login({
    required String email,
    required String password,
  }) async {
    final Either<AppError, AuthSession> result = await _remoteDataSource.login(
      email: email,
      password: password,
    );

    return result.fold(left, (AuthSession session) async {
      try {
        await _localDataSource.cacheSession(session);
        return right<AppError, AuthSession>(session);
      } catch (_) {
        return left<AppError, AuthSession>(
          const AppError('Something went wront! Please try again later.'),
        );
      }
    });
  }

  @override
  Future<Either<AppError, Unit>> register({
    required String name,
    required String email,
    required String password,
  }) {
    return _remoteDataSource.register(
      name: name,
      email: email,
      password: password,
    );
  }
}
