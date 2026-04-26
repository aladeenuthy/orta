import 'package:orta/features/features.dart';

class AuthServiceLocator implements ServiceLocator {
  @override
  Future<void> register() async {
    locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(api: locator<Api>()),
    );

    locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(storage: locator<LocalStorage>()),
    );

    locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: locator<AuthRemoteDataSource>(),
        localDataSource: locator<AuthLocalDataSource>(),
      ),
    );

    locator.registerLazySingleton<AuthService>(
      () => AuthService(repository: locator<AuthRepository>()),
    );
  }
}
