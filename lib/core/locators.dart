import '../features/features.dart';

class Locators {
  static register() async {
    List<ServiceLocator> locators = <ServiceLocator>[
      CoreServiceLocator(),
      AuthServiceLocator(),
      ShiftsServiceLocator(),
      WorkerProfileServiceLocator(),
    ];
    for (final ServiceLocator item in locators) {
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await item.register();
    }
  }
}
