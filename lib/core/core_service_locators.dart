import "../features/features.dart";

class CoreServiceLocator implements ServiceLocator {
  @override
  Future<void> register() async {
    locator.registerSingleton<FlutterSecureStorage>(
      const FlutterSecureStorage(),
    );

    locator.registerSingleton<LocalStorage>(
      LocalStorage(storage: locator<FlutterSecureStorage>()),
    );

    locator.registerSingleton<Api>(Api());
  }
}
