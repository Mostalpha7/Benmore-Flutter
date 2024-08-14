import '../constants/constants.dart';

class OtherErrors implements Exception {
  final dynamic message;

  OtherErrors([this.message]);

  @override
  String toString() {
    var msg = message.toString();

    if (message is FormatException) {
      return Constants.kServiceUnavailable;
    }
    if (msg.startsWith("Exception")) {
      return msg.replaceFirst("Exception:", "").trim();
    } else if (msg.contains(":")) {
      return msg.substring(msg.indexOf(":")).trim();
    }
    return message.toString().trim();
  }
}
