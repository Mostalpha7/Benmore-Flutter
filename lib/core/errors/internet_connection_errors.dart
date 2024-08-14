import '../constants/constants.dart';

class InternetConnectionError implements Exception {
  String get message => Constants.kConnectionError;

  @override
  String toString() => Constants.kConnectionError;
}
