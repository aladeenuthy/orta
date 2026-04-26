import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

abstract class AuthRepository {
  Future<Either<AppError, AuthSession>> login({
    required String email,
    required String password,
  });

  Future<Either<AppError, Unit>> register({
    required String name,
    required String email,
    required String password,
  });
}
