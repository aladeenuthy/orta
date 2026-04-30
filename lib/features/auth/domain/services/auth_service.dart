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

  Future<Either<AppError, Unit>> resendOtp({required String email}) {
    return _repository.resendOtp(email: email);
  }

  Future<Either<AppError, Unit>> sendOtp({required String email}) {
    return _repository.sendOtp(email: email);
  }

  Future<Either<AppError, AuthSession?>> getCachedSession() {
    return _repository.getCachedSession();
  }

  Future<Either<AppError, AuthSession>> updateCachedUserFromProfile(
    Profile profile,
  ) async {
    final Either<AppError, AuthSession?> sessionResult = await _repository
        .getCachedSession();

    return sessionResult.fold(
      (AppError error) async => left<AppError, AuthSession>(error),
      (AuthSession? session) async {
        if (session == null) {
          return left<AppError, AuthSession>(
            const AppError('Please login again to continue'),
          );
        }

        final AuthSession updatedSession = session.copyWith(
          user: session.user.copyWith(
            name: profile.name,
            email: profile.email,
            phone: profile.phone,
            city: profile.city,
            jobRole: profile.jobRole,
            skills: profile.skills,
            profilePictureUrl: profile.profilePictureUrl,
            isProfileComplete: profile.isProfileComplete,
          ),
        );
        final Either<AppError, AuthSession> result = await _repository
            .cacheSession(updatedSession);

        result.fold((_) {}, (AuthSession session) {
          publishEvent(AuthSessionUpdated(session));
        });

        return result;
      },
    );
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

  Future<Either<AppError, AuthSession>> register({
    required String name,
    required String email,
    required String password,
  }) {
    return _repository
        .register(name: name, email: email, password: password)
        .then((Either<AppError, AuthSession> result) {
          result.fold((_) {}, (AuthSession session) {
            publishEvent(AuthSessionUpdated(session));
          });

          return result;
        });
  }

  Future<Either<AppError, Unit>> resetPassword({
    required String userId,
    required String resetToken,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword != confirmPassword) {
      return Future<Either<AppError, Unit>>.value(
        left<AppError, Unit>(const AppError('Passwords do not match')),
      );
    }

    final Either<AppError, Unit> result = await _repository.resetPassword(
      userId: userId,
      resetToken: resetToken,
      newPassword: newPassword,
    );

    return result.fold(left, (_) => clearSession());
  }

  Future<Either<AppError, AuthSession>> verifyOtp({
    required String email,
    required String otp,
  }) {
    if (otp.length != 6) {
      return Future<Either<AppError, AuthSession>>.value(
        left<AppError, AuthSession>(const AppError('Enter the 6-digit code')),
      );
    }

    return _repository.verifyOtp(email: email, otp: otp).then((
      Either<AppError, AuthSession> result,
    ) {
      result.fold((_) {}, (AuthSession session) {
        publishEvent(AuthSessionUpdated(session));
      });

      return result;
    });
  }
}
