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
  Future<Either<AppError, Unit>> clearSession() async {
    try {
      await _localDataSource.clearSession();
      return right<AppError, Unit>(unit);
    } catch (_) {
      return left<AppError, Unit>(
        const AppError('Something went wront! Please try again later.'),
      );
    }
  }

  @override
  Future<Either<AppError, Unit>> forgotPassword({required String email}) {
    return _remoteDataSource.forgotPassword(email: email);
  }

  @override
  Future<Either<AppError, AuthSession?>> getCachedSession() async {
    try {
      final AuthSession? session = await _localDataSource.getCachedSession();
      return right<AppError, AuthSession?>(session);
    } catch (_) {
      return left<AppError, AuthSession?>(
        const AppError('Something went wront! Please try again later.'),
      );
    }
  }

  @override
  Future<Either<AppError, User>> getUser() async {
    final Either<AppError, User> result = await _remoteDataSource.getUser();

    return result.fold(left, (User user) async {
      try {
        await _localDataSource.cacheUser(user);
        return right<AppError, User>(user);
      } catch (_) {
        return left<AppError, User>(
          const AppError('Something went wront! Please try again later.'),
        );
      }
    });
  }

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

  @override
  Future<Either<AppError, Unit>> resetPassword({
    required String userId,
    required String resetToken,
    required String newPassword,
  }) {
    return _remoteDataSource.resetPassword(
      userId: userId,
      resetToken: resetToken,
      newPassword: newPassword,
    );
  }
}
