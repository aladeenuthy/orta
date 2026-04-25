import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacings {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;
  static const double body = 24.0;

  static Widget verticalSpaceSmall() => SizedBox(height: small.h);
  static Widget verticalSpaceMedium() => SizedBox(height: medium.h);
  static Widget verticalSpaceLarge() => SizedBox(height: large.h);
  static Widget verticalSpaceExtraLarge() => SizedBox(height: extraLarge.h);

  static Widget horizontalSpaceSmall() => SizedBox(width: small.w);
  static Widget horizontalSpaceMedium() => SizedBox(width: medium.w);
  static Widget horizontalSpaceLarge() => SizedBox(width: large.w);
  static Widget horizontalSpaceExtraLarge() => SizedBox(width: extraLarge.w);

  static Widget vertical(double height) => SizedBox(height: height.h);
  static Widget horizontal(double width) => SizedBox(width: width.w);
}

class AppPaddings {
  static const EdgeInsets smallHorizontal = EdgeInsets.symmetric(horizontal: AppSpacings.small);
  static const EdgeInsets mediumHorizontal = EdgeInsets.symmetric(horizontal: AppSpacings.medium);
  static const EdgeInsets largeHorizontal = EdgeInsets.symmetric(horizontal: AppSpacings.large);
  static const EdgeInsets extraLargeHorizontal = EdgeInsets.symmetric(horizontal: AppSpacings.extraLarge);

  static const EdgeInsets smallVertical = EdgeInsets.symmetric(vertical: AppSpacings.small);
  static const EdgeInsets mediumVertical = EdgeInsets.symmetric(vertical: AppSpacings.medium);
  static const EdgeInsets largeVertical = EdgeInsets.symmetric(vertical: AppSpacings.large);
  static const EdgeInsets extraLargeVertical = EdgeInsets.symmetric(vertical: AppSpacings.extraLarge);

  static const EdgeInsets small = EdgeInsets.all(AppSpacings.small);
  static const EdgeInsets medium = EdgeInsets.all(AppSpacings.medium);
  static const EdgeInsets large = EdgeInsets.all(AppSpacings.large);
  static const EdgeInsets largeTop = EdgeInsets.only(top: AppSpacings.large);
  
  static const EdgeInsets extraLarge = EdgeInsets.all(AppSpacings.extraLarge);

  static EdgeInsets body = EdgeInsets.all(AppSpacings.body.h);
  static EdgeInsets bodyHorizontal = EdgeInsets.symmetric(horizontal: AppSpacings.body.w);
  static EdgeInsets bodyVertical = EdgeInsets.symmetric(vertical: AppSpacings.body.h);
  static EdgeInsets vertical(double vertical) => EdgeInsets.symmetric(vertical: vertical.h);
  static EdgeInsets horizontal(double horizontal) => EdgeInsets.symmetric(horizontal: horizontal.w);
  static EdgeInsets all(double value) => EdgeInsets.all(value.h);
}
