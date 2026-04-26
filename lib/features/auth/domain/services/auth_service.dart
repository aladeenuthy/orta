import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AuthService {
  AuthService({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;

  Future<Either<AppError, Unit>> forgotPassword({required String email}) {
    return _repository.forgotPassword(email: email);
  }

  Future<Either<AppError, User>> getUser() {
    return _repository.getUser();
  }

  Future<Either<AppError, AuthSession>> login({
    required String email,
    required String password,
  }) {
    return _repository.login(email: email, password: password);
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
