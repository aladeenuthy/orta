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

    locator.registerLazySingleton<AuthCubit>(
      () => AuthCubit(authService: locator<AuthService>()),
    );

    locator.registerFactory<LoginCubit>(
      () => LoginCubit(authService: locator<AuthService>()),
    );

    locator.registerFactory<RegisterCubit>(
      () => RegisterCubit(authService: locator<AuthService>()),
    );

    locator.registerFactory<ForgotPasswordCubit>(
      () => ForgotPasswordCubit(authService: locator<AuthService>()),
    );

    locator.registerFactory<ResetPasswordCubit>(
      () => ResetPasswordCubit(authService: locator<AuthService>()),
    );

    locator.registerFactory<OtpVerificationCubit>(
      () => OtpVerificationCubit(authService: locator<AuthService>()),
    );
  }
}
