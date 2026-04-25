import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

abstract class ServiceLocator {
  Future<void> register();
}