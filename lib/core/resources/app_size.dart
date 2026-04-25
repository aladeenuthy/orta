import "package:flutter/material.dart";

class AppSize {
  static const double s0 = 0;
  static const double s1_5 = 1.5;
  static const double s4 = 4.0;
  static const double s5 = 5.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s28 = 28.0;
  static const double s30 = 30.0;
  static const double s32 = 32.0;
  static const double s40 = 40.0;
  static const double s50 = 50.0;
  static const double s60 = 60.0;
  static const double s70 = 70.0;
  static const double s80 = 80.0;
  static const double s100 = 100.0;
  static const double s120 = 120.0;
  static const double s150 = 150.0;
  static const double s160 = 160.0;
  static const double s170 = 170.0;
  static const double s180 = 180.0;
  static const double s200 = 200.0;
  static const double s220 = 220.0;
  static const double s250 = 250.0;
}

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? textSizeMultiplier;
  static double? imageSizeMultiplier;

  static double? heightMultiplier;
  static double? widthMultiplier;

  void init(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textSizeMultiplier = blockSizeHorizontal;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
    widthMultiplier = blockSizeHorizontal;
  }
}

double calculateCrossAxisSpacing(double screenWidth) {
  if (screenWidth <= 400) {
    return 4; // Smaller devices
  } else if (screenWidth <= 900) {
    return 2; // Medium devices
  } else {
    return 4; // Larger screens
  }
}

double calculateChildAspectRatio(double screenWidth) {
  if (screenWidth <= 400) {
    return 0.75; // Smaller devices
  } else if (screenWidth <= 900) {
    return 0.9; // Medium devices
  } else {
    return 1.0; // Larger screens
  }
}
