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

    locator.registerLazySingleton<ShiftActionRules>(ShiftActionRules.new);

    locator.registerFactoryParam<PaginatedShiftsBloc, ShiftFilters, int>(
      (ShiftFilters filters, int limit) => PaginatedShiftsBloc(
        shiftsService: locator<ShiftsService>(),
        filters: filters,
        limit: limit,
      ),
    );

    locator.registerFactory<MarketplaceShiftsBloc>(
      () => MarketplaceShiftsBloc(shiftsService: locator<ShiftsService>()),
    );

    locator.registerFactory<ShiftDetailCubit>(
      () => ShiftDetailCubit(shiftsService: locator<ShiftsService>()),
    );

    locator.registerFactory<ShiftActionsCubit>(
      () => ShiftActionsCubit(shiftsService: locator<ShiftsService>()),
    );

    locator.registerFactory<MarketplaceActionsCubit>(
      () => MarketplaceActionsCubit(shiftsService: locator<ShiftsService>()),
    );

    locator.registerFactory<ShiftActionEligibilityCubit>(
      () => ShiftActionEligibilityCubit(
        locationService: locator<LocationService>(),
        shiftActionRules: locator<ShiftActionRules>(),
        shiftsService: locator<ShiftsService>(),
      ),
    );
  }
}
