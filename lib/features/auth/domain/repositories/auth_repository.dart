import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

abstract class AuthRepository {
  Future<Either<AppError, Unit>> clearSession();

  Future<Either<AppError, Unit>> forgotPassword({required String email});

  Future<Either<AppError, Unit>> resendOtp({required String email});

  Future<Either<AppError, Unit>> sendOtp({required String email});

  Future<Either<AppError, AuthSession?>> getCachedSession();

  Future<Either<AppError, User>> getUser();

  Future<Either<AppError, AuthSession>> login({
    required String email,
    required String password,
  });

  Future<Either<AppError, AuthSession>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<AppError, Unit>> resetPassword({
    required String userId,
    required String resetToken,
    required String newPassword,
  });

  Future<Either<AppError, AuthSession>> verifyOtp({
    required String email,
    required String otp,
  });
}
