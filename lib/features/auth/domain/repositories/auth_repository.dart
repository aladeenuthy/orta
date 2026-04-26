import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

abstract class AuthRepository {
  Future<Either<AppError, Unit>> register({
    required String name,
    required String email,
    required String password,
  });
}
