import 'package:orta/features/features.dart';

class AuthServiceLocator implements ServiceLocator {
  @override
  Future<void> register() async {
    locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(api: locator<Api>()),
    );

    locator.registerLazySingleton<AuthRepository>(
      () =>
          AuthRepositoryImpl(remoteDataSource: locator<AuthRemoteDataSource>()),
    );

    locator.registerLazySingleton<AuthService>(
      () => AuthService(repository: locator<AuthRepository>()),
    );
  }
}
