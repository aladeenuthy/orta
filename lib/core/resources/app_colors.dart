import "package:flutter/material.dart";

class AppColors {
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color primary = HexColor.fromHex("#C93905");
  static Color secondary = HexColor.fromHex("#C93905");
  static Color textColor = HexColor.fromHex("#171717");
  static Color appBgColor = HexColor.fromHex("#FFFFFF");
  static Color grey = HexColor.fromHex("#D9D9D9");
  static Color textSecondary = HexColor.fromHex("#6B6B6B");
  static Color primaryLight = HexColor.fromHex("#F4E8E3");
  static Color ongoingChipBg = HexColor.fromHex("#FDF0EA");
  static Color cardBorder = HexColor.fromHex("#E8E8E8");
  static Color bottomNavInactive = HexColor.fromHex("#D5D5D5");
  static Color brandGreen = HexColor.fromHex("#28B463");
  static Color greyDark = HexColor.fromHex("#8A8A8A");
  static Color alert = HexColor.fromHex("#D92D20");
  static Color fieldBorder = HexColor.fromHex("#D8D8D8");
  static Color cardGridLine = HexColor.fromHex("#F1F1F1");
  static Color cardGridAccent = HexColor.fromHex("#F6A06C");
  static Color success = HexColor.fromHex("#00C851");
  static Color successLight = HexColor.fromHex("#55D187");
  static Color warning = HexColor.fromHex("#ffbb33");
  static Color error = HexColor.fromHex("#ff4444");
  static Color orange = HexColor.fromHex("#f56e13");
  static Color pageMutedBackground = HexColor.fromHex("#F5F6F8");
  static Color avatarBlue = HexColor.fromHex("#8DBAF4");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "").trim();

    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
