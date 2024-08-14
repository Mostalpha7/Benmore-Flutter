import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../presentation/misc/custom_toast/custom_toast.dart';
import 'enum.dart';

String throwHttpError(res) {
  return res["message"] ??
      res["error"] ??
      "An error occured. please try again.";
}

String capitalizeFirstString(String? s) {
  if (s == null || s == '') return '';
  if (s.isEmpty) return '';
  return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
}

String enumToString(val) => val.toString().split(".").last;

Future<void> copyToClipboard(BuildContext context, String text,
    {String? successMsg}) async {
  await Clipboard.setData(ClipboardData(text: text)).then((_) {
    showCustomToast(
        context: context,
        description: successMsg ?? "Text copied to clipboard successfully.",
        type: ToastType.success);
  });
}
