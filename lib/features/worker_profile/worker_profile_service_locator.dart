import 'package:orta/features/features.dart';

class WorkerProfileServiceLocator implements ServiceLocator {
  @override
  Future<void> register() async {
    locator.registerLazySingleton<WorkerProfileRemoteDataSource>(
      () => WorkerProfileRemoteDataSource(api: locator<Api>()),
    );

    locator.registerLazySingleton<WorkerProfileRepository>(
      () => WorkerProfileRepositoryImpl(
        remote: locator<WorkerProfileRemoteDataSource>(),
      ),
    );

    locator.registerLazySingleton<WorkerProfileService>(
      () =>
          WorkerProfileService(repository: locator<WorkerProfileRepository>()),
    );

    locator.registerLazySingleton<AvailabilityService>(
      () => AvailabilityService(repository: locator<WorkerProfileRepository>()),
    );

    locator.registerLazySingleton<UnavailabilityService>(
      () =>
          UnavailabilityService(repository: locator<WorkerProfileRepository>()),
    );

    locator.registerLazySingleton<ProfileOnboardingCubit>(
      () => ProfileOnboardingCubit(
        workerProfileService: locator<WorkerProfileService>(),
      ),
    );

    locator.registerLazySingleton<AvailabilityCubit>(
      () => AvailabilityCubit(
        availabilityService: locator<AvailabilityService>(),
      ),
    );

    locator.registerFactory<WorkerProfileCubit>(
      () => WorkerProfileCubit(
        workerProfileService: locator<WorkerProfileService>(),
      ),
    );

    locator.registerFactory<UnavailabilityCubit>(
      () => UnavailabilityCubit(
        unavailabilityService: locator<UnavailabilityService>(),
      ),
    );
  }
}
