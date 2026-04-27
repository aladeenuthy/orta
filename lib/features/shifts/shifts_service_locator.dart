import 'package:orta/features/features.dart';

class ShiftsServiceLocator implements ServiceLocator {
  @override
  Future<void> register() async {
    locator.registerLazySingleton<ShiftsRemoteDataSource>(
      () => ShiftsRemoteDataSource(api: locator<Api>()),
    );

    locator.registerLazySingleton<ShiftsRepository>(
      () => AppMocks.previewHomeDashboard
          ? const MockShiftsRepository()
          : ShiftsRepositoryImpl(
              remoteDataSource: locator<ShiftsRemoteDataSource>(),
            ),
    );

    locator.registerLazySingleton<ShiftsService>(
      () => ShiftsService(repository: locator<ShiftsRepository>()),
    );

    locator.registerFactoryParam<PaginatedShiftsBloc, ShiftFilters, int>(
      (ShiftFilters filters, int limit) => PaginatedShiftsBloc(
        shiftsService: locator<ShiftsService>(),
        filters: filters,
        limit: limit,
      ),
    );

    locator.registerFactory<ShiftDetailCubit>(
      () => ShiftDetailCubit(shiftsService: locator<ShiftsService>()),
    );

    locator.registerFactory<ShiftActionsCubit>(
      () => ShiftActionsCubit(shiftsService: locator<ShiftsService>()),
    );
  }
}
