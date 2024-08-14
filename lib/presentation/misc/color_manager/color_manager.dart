import 'package:flutter/material.dart';

class ColorManager {
  // Main
  static Color kPrimary = HexColor.fromHex("#E05060");
  static Color kPrimaryLight = HexColor.fromHex("#FFE1FD");

  static Color kError = HexColor.fromHex("#FB6464");
  static Color kSuccess = HexColor.fromHex("#10BD40");
  static Color kSuccessAlt = HexColor.fromHex("#DCFFE4");

  static Color kNotificationUnread =
      HexColor.fromHex("#F0FBFF").withOpacity(.67);

  // GENERIC
  static Color kWhite = HexColor.fromHex("#FFFFFF");
  static Color kBlack = HexColor.fromHex("#000000");

  // TEXT
  static Color kTextDark = HexColor.fromHex("##313146");
  static Color kSmallText = HexColor.fromHex("#6C7D98");
  static Color kTextDark7 = ColorManager.kTextDark.withOpacity(.7);
  static Color kTextColor = HexColor.fromHex("#1C1C1C");
  static Color kFadedTextColor = HexColor.fromHex("#333333");

  //OTHERS
  static Color kBarColor = HexColor.fromHex("#C8CED7");
  static Color kDividerColor = HexColor.fromHex("#C8CED7").withOpacity(.49);

  // NOTIFICATION
  static Color kNotificationSuccess = HexColor.fromHex("#25D366");
  static Color kNotificationSuccessBg = HexColor.fromHex("#E3FEE5");

  static Color kNotificationError = HexColor.fromHex("#F16E6E");
  static Color kNotificationErrorBg = HexColor.fromHex("#FFF3F3");
  static Color kNotificationErrorBorder = HexColor.fromHex("#FFCECE");

  // FORM
  static Color kFormBg = HexColor.fromHex("#FAFAFA");
  static Color kFormInactiveBorder = HexColor.fromHex("#F2F2F2");
  static Color kFormHintText = HexColor.fromHex("#AFAFAF");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
