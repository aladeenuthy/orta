import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'core/locators.dart';
import 'core/route/deep_link_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await ScreenUtil.ensureScreenSize();
  await Locators.register();
  runApp(const MyApp());
  DeepLinkHandler.instance.init();
}
