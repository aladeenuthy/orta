import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AuthRemoteDataSource extends BaseAppRepository {
  AuthRemoteDataSource({required super.api});

  Future<Either<AppError, Unit>> forgotPassword({required String email}) {
    return makeRequest(() async {
      await post(
        Endpoints.forgotPassword,
        data: <String, dynamic>{'email': email},
      );

      return right<AppError, Unit>(unit);
    });
  }

  Future<Either<AppError, User>> getUser() {
    return makeRequest(() async {
      final response = await get(Endpoints.getUser);
      final Map<String, dynamic> data = Map<String, dynamic>.from(
        response.data as Map,
      );
      final User user = User.fromJson(
        Map<String, dynamic>.from(data['user'] as Map),
      );

      return right<AppError, User>(user);
    });
  }

  Future<Either<AppError, AuthSession>> login({
    required String email,
    required String password,
  }) {
    return makeRequest(() async {
      final response = await post(
        Endpoints.login,
        data: <String, dynamic>{'email': email, 'password': password},
      );

      final AuthSession session = AuthSession.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );

      return right<AppError, AuthSession>(session);
    });
  }

  Future<Either<AppError, Unit>> register({
    required String name,
    required String email,
    required String password,
  }) {
    return makeRequest(() async {
      await post(
        Endpoints.register,
        data: <String, dynamic>{
          'name': name,
          'email': email,
          'password': password,
        },
      );

      return right<AppError, Unit>(unit);
    });
  }

  Future<Either<AppError, Unit>> resetPassword({
    required String userId,
    required String resetToken,
    required String newPassword,
  }) {
    return makeRequest(() async {
      await post(
        Endpoints.resetPassword,
        data: <String, dynamic>{
          'id': userId,
          'resetToken': resetToken,
          'newPassword': newPassword,
        },
      );

      return right<AppError, Unit>(unit);
    });
  }
}
