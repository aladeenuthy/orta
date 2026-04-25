import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'core/locators.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Locators.register();
  runApp(const MyApp());
}
