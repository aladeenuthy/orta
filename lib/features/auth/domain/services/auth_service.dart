import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AuthService extends BaseAppService {
  AuthService({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;

  Future<Either<AppError, Unit>> clearSession() async {
    final Either<AppError, Unit> result = await _repository.clearSession();

    result.fold((_) {}, (_) => publishEvent(const AuthSessionCleared()));

    return result;
  }

  Future<Either<AppError, Unit>> forgotPassword({required String email}) {
    return _repository.forgotPassword(email: email);
  }

  Future<Either<AppError, AuthSession?>> getCachedSession() {
    return _repository.getCachedSession();
  }

  Future<Either<AppError, User>> getUser() async {
    final Either<AppError, User> result = await _repository.getUser();

    await result.fold((_) async {}, (_) async {
      final Either<AppError, AuthSession?> sessionResult = await _repository
          .getCachedSession();

      sessionResult.fold((_) {}, (AuthSession? session) {
        if (session != null) {
          publishEvent(AuthSessionUpdated(session));
        }
      });
    });

    return result;
  }

  Future<Either<AppError, AuthSession>> login({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password).then((
      Either<AppError, AuthSession> result,
    ) {
      result.fold((_) {}, (AuthSession session) {
        publishEvent(AuthSessionUpdated(session));
      });

      return result;
    });
  }

  Future<Either<AppError, Unit>> register({
    required String name,
    required String email,
    required String password,
  }) {
    return _repository.register(name: name, email: email, password: password);
  }

  Future<Either<AppError, Unit>> resetPassword({
    required String userId,
    required String resetToken,
    required String newPassword,
    required String confirmPassword,
  }) {
    if (newPassword != confirmPassword) {
      return Future<Either<AppError, Unit>>.value(
        left<AppError, Unit>(const AppError('Passwords do not match')),
      );
    }

    return _repository.resetPassword(
      userId: userId,
      resetToken: resetToken,
      newPassword: newPassword,
    );
  }
}
