import 'package:orta/features/features.dart';

class ShiftsServiceLocator implements ServiceLocator {
  @override
  Future<void> register() async {
    locator.registerLazySingleton<ShiftsRemoteDataSource>(
      () => ShiftsRemoteDataSource(api: locator<Api>()),
    );

    locator.registerLazySingleton<ShiftsRepository>(
      () => ShiftsRepositoryImpl(
        remoteDataSource: locator<ShiftsRemoteDataSource>(),
      ),
    );

    locator.registerLazySingleton<ShiftsService>(
      () => ShiftsService(repository: locator<ShiftsRepository>()),
    );
  }
}
