import 'package:flutter/material.dart';

import '../color_manager/color_manager.dart';

Widget customDivider(
        {EdgeInsetsGeometry? margin,
        double? height,
        double? width,
        Color? color}) =>
    Container(
        width: width ?? double.infinity,
        height: height ?? .85,
        margin: margin ?? EdgeInsets.zero,
        color: color ?? ColorManager.kBarColor);
