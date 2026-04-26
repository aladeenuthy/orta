import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AuthService {
  AuthService({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;

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
}
