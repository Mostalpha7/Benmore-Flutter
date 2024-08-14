import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../color_manager/color_manager.dart';

class TextStyleManager {
  static final TextStyle _getTextStyle =
      TextStyle(fontFamily: "Geist-Black", color: ColorManager.kTextDark);

  static TextStyle get16TextStyle() {
    return _getTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  }

  static TextStyle get18TextStyle() {
    return _getTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  }

  static TextStyle get14TextStyle() {
    return _getTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  }

  static TextStyle getPrefixTextStyle() {
    return _getTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400);
  }

  static TextStyle get10TextStyle() {
    return _getTextStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w400);
  }

  static TextStyle get11TextStyle() {
    return _getTextStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w400);
  }

  static TextStyle get12TextStyle() {
    return _getTextStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
  }

  static TextStyle get22TextStyle() {
    return _getTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w700);
  }

  static TextStyle get26TextStyle() {
    return _getTextStyle.copyWith(fontSize: 26, fontWeight: FontWeight.w700);
  }

  static TextStyle get28TextStyle() {
    return _getTextStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w800);
  }

  static TextStyle get24TextStyle() {
    return _getTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  }

  static TextStyle get32TextStyle() {
    return _getTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w700);
  }

  static TextStyle get20TextStyle() {
    return _getTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w700);
  }

  static TextStyle getHintTextStyle() {
    return _getTextStyle.copyWith(
        fontSize: 14,
        color: ColorManager.kFormHintText,
        fontWeight: FontWeight.w400);
  }

  static TextStyle getBtnTextStyle() {
    return _getTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
  }

  static PinTheme getPinTheme({double? width}) => PinTheme(
      activeColor: ColorManager.kWhite,
      inactiveFillColor: ColorManager.kWhite,
      selectedColor: ColorManager.kWhite,
      activeFillColor: ColorManager.kFormBg,
      selectedFillColor: ColorManager.kFormBg,
      errorBorderColor: Colors.black,
      inactiveColor: ColorManager.kBlack,
      shape: PinCodeFieldShape.box,
      borderWidth: 0,
      borderRadius: BorderRadius.circular(19),
      fieldHeight: 53,
      fieldWidth: width ?? 45,
      fieldOuterPadding: const EdgeInsets.only(left: 15));

  static Widget dropDownIcon(
          {Color? color, EdgeInsetsGeometry? padding, double? width}) =>
      Padding(
        padding: padding ?? const EdgeInsets.only(right: 13),
        child: Icon(Icons.keyboard_arrow_down_rounded,
            size: width ?? 30, color: color),
      );

  static Widget dateIcon(
          {Color? color, EdgeInsetsGeometry? padding, double? size}) =>
      Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 13),
        child: Icon(Icons.calendar_month_sharp,
            size: size ?? 30, color: color ?? ColorManager.kPrimary),
      );

  static Widget searchSuffix() => SizedBox(
        width: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // customDivider(width: 1, height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                CupertinoIcons.search,
                color: ColorManager.kTextColor,
              ),
            ),
          ],
        ),
      );

  static InputDecoration getSearchInputDecoration(
          {String? hintText,
          Widget? suffixIcon,
          Widget? prefixIcon,
          EdgeInsetsGeometry? padding}) =>
      InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1.2,
            color: Color(0xffF4F4F4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1.2, color: Color(0xffF4F4F4)),
        ),
        border: InputBorder.none,
        hintText: hintText ?? 'Search',
        suffixIcon: suffixIcon ??
            const Padding(
              padding: EdgeInsets.only(right: 13),
              child: SizedBox(
                width: 20,
                height: 20,
                child: Center(child: Icon(LucideIcons.search, size: 20)),
              ),
            ),
        contentPadding:
            padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        fillColor: const Color(0xffF4F4F4),
        filled: true,
        prefixIcon: prefixIcon,
      );
}
