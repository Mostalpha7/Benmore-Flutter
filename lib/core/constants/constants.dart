import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String kBaseurl = kReleaseMode
      ? "https://prod-api.domain.com"
      : "https://staging-api.domain.com";

  static const String serverError = "A server error occured, please try again.";
  static const kConnectionError =
      "Connection could not be established. Please check internet connection";

  static const kServiceUnavailable =
      "Service currently unavailable. Please try again later";

  static const Duration kDefaultToatDelay = Duration(milliseconds: 1000);

  // static double get650ModalHeight(BuildContext context) =>
  //     isSmallScreen(context) ? 450 : 650;
  static const double kHorizontalScreenPadding = 15;
}
