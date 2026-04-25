

import '../config/environment_config.dart';

abstract class BaseApi {
  String get apiUrl {
    return AppConfig.apiBaseUrl;
  }
}
