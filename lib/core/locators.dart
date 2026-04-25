import 'core_service_locators.dart';
import 'service_locator.dart';

class Locators {
  static register() async {
    List<ServiceLocator> locators = <ServiceLocator>[
      CoreServiceLocator(),
    ];
    for (final ServiceLocator item in locators) {
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await item.register();
    }
  }
}
