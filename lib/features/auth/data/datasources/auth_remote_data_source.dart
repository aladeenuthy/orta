import 'package:dartz/dartz.dart';
import 'package:orta/features/features.dart';

class AuthRemoteDataSource extends BaseAppRepository {
  AuthRemoteDataSource({required super.api});

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
}
