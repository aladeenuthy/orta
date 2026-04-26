import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final AuthRemoteDataSource _remoteDataSource;

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
