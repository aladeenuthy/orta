import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

extension DoubleExt on double {
  double get width => ScreenUtil().setWidth(this);
  double get height => ScreenUtil().setHeight(this);
  // double get sp => ScreenUtil().setSp(this);

  /// a spacer widget
  Spacer get s => const Spacer();

  /// convert a double field to SizedBox with its height
  SizedBox get h => SizedBox(height: this);

  /// convert a double field to SizedBox with its widget
  SizedBox get w => SizedBox(width: this);

  /// convert a double field to border radius with radius of its value
  BorderRadius get toBorderRadius => BorderRadius.circular(this);

  /// convert a double field to horizontal padding using its value
  EdgeInsets get toHorizontalPadding => EdgeInsets.symmetric(horizontal: this);

  /// convert a double field to vertical padding using its value
  EdgeInsets get toVerticalPadding => EdgeInsets.symmetric(horizontal: this);
}

extension IntExt on int {
  /// returns date in milliseconds as current Time + (this represented as seconds)
  int get secondsToMilliseconds => DateTime.now().add(Duration(seconds: this)).millisecondsSinceEpoch;

  /// convert an integer to duration in milliseconds
  Duration get toDurationInMilliseconds => Duration(milliseconds: this);

  /// compares time in milliseconds against current timestamp
  /// and returns true if time is past
  bool get isPast => DateTime.now().millisecondsSinceEpoch > this;
  // double get height => ScreenUtil().setHeight(this);

  /// returns value as duration in seconds
  Duration get inMilliseconds => Duration(milliseconds: this);

  
}
