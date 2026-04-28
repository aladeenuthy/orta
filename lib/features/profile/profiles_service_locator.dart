import 'package:orta/features/features.dart';

class ProfilesServiceLocator implements ServiceLocator {
  @override
  Future<void> register() async {
    locator.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(api: locator<Api>()),
    );

    locator.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remote: locator<ProfileRemoteDataSource>()),
    );

    locator.registerLazySingleton<ProfileService>(
      () => ProfileService(repository: locator<ProfileRepository>()),
    );

    locator.registerLazySingleton<AvailabilityService>(
      () => AvailabilityService(repository: locator<ProfileRepository>()),
    );

    locator.registerLazySingleton<UnavailabilityService>(
      () => UnavailabilityService(repository: locator<ProfileRepository>()),
    );

    locator.registerLazySingleton<ProfileOnboardingCubit>(
      () => ProfileOnboardingCubit(profileService: locator<ProfileService>()),
    );

    locator.registerLazySingleton<AvailabilityCubit>(
      () => AvailabilityCubit(
        availabilityService: locator<AvailabilityService>(),
      ),
    );

    locator.registerFactory<ProfileCubit>(
      () => ProfileCubit(profileService: locator<ProfileService>()),
    );

    locator.registerFactory<UnavailabilityCubit>(
      () => UnavailabilityCubit(
        unavailabilityService: locator<UnavailabilityService>(),
      ),
    );
  }
}
