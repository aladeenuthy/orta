import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get apiBaseUrl {
    if (Platform.isAndroid) {
      return dotenv.maybeGet('API_BASE_URL_ANDROID') ?? '';
    } else if (Platform.isIOS) {
      return dotenv.maybeGet('API_BASE_URL') ?? '';
    }

    return '';
  }
}
