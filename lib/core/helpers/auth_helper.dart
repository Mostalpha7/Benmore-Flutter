import 'package:flutter/material.dart';

import '../../app/app.dart';
import '../services/secure_storage.dart';
import '../utils/enum.dart';

/// THE METHODS IN THIS CLASS SHOULD CALL ACTUAL ENDPOINT BUT SINCE NONE IS AVAILABLE THEIR RESPONSES ARE MOCKED. ///

class AuthHelper {
  static Future<bool> signUp(
      {required String firstname,
      required String lastname,
      required String email,
      required String password,
      String? referrerCode}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return true;
  }

  static Future<String> resendOtp({required String token}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return "OTP resent successfully";
  }

  // //
  static Future<String> verifyEmail(
      {required String code, required String token}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return "Email verification successful";
  }

  static Future<String> verifyPasswordResetOtp(
      {required String email, required String token}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return "OTP verified successfully";
  }

  static Future<bool> signIn(LoginProvider loginProvider,
      {String? email, String? password, String? user_token}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return true;
  }

  static Future<String> resendPasswordResetOtp({required String email}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return "OTP resent successfully";
  }

  static Future<String> resend2FAOtp({required String email}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return "OTP resent successfully";
  }

  // static SecureStorage? _prefs;
  // static Future<void> _saveLoginCred({
  //   required LoginProvider loginProvider,
  //   required Map<String, dynamic> user,
  //   required String? user_token,
  //   required String? password,
  //   required String? email,
  //   required String token,
  //   required String? biometric_token,
  // }) async {
  //   _prefs ??= await SecureStorage.getInstance();
  //   await _prefs!.setString(
  //     Constants.kCachedAuthKey,
  //     json.encode(
  //       {
  //         "loginProvider": enumToString(loginProvider),
  //         "user_token": user_token,
  //         "password": password,
  //         "token": token,
  //         "user": user,
  //         "email": email,
  //         "biometric_token": biometric_token
  //       },
  //     ),
  //   );
  // }

  // static Future<String?> getCacheBiometricToken() async {
  //   _prefs ??= await SecureStorage.getInstance();
  //   String? dt = _prefs!.getString(Constants.kCachedAuthKey);
  //   var authCred = json.decode(dt!);

  //   return authCred['biometric_token'];
  // }

  // static Future<void> updateBiometricToken(String biometricToken) async {
  //   _prefs ??= await SecureStorage.getInstance();
  //   String? dt = _prefs!.getString(Constants.kCachedAuthKey);
  //   var authCred = json.decode(dt!);
  //   authCred['biometric_token'] = biometricToken;
  //   await _prefs!.setString(Constants.kCachedAuthKey, json.encode(authCred));
  // }

  // static Future<void> routeAuthenticated(BuildContext context,
  //     {required User user, String? password}) async {
  //   String? token = await SecureStorage.getInstance().then((pref) {
  //     var authCred = pref.getString(Constants.kCachedAuthKey);
  //     return json.decode(authCred ?? "")['token'];
  //   }).catchError((_) {});

  //   // VERIFY EMAIL
  //   if (user.email_verified == false) {
  //     // ignore: use_build_context_synchronously
  //     Navigator.pushNamed(
  //       context,
  //       RoutesManager.verifyEmail,
  //       arguments: VerifyEmailArg(
  //         emailVerificationType: EmailVerificationType.login,
  //         user: user,
  //         token: token ?? "",
  //       ),
  //     );

  //     return;
  //   }

  //   // // SET TXN PIN
  //   if (user.pin_activated == false) {
  //     // ignore: use_build_context_synchronously
  //     Navigator.pushNamed(context, RoutesManager.setTransactionPin);
  //     return;
  //   }

  //   // // FOR 2FA VERIFICATION
  //   if (user.two_factor_enabled) {
  //     // ignore: use_build_context_synchronously
  //     Navigator.pushNamed(
  //       context,
  //       RoutesManager.verifyEmail,
  //       arguments: VerifyEmailArg(
  //         emailVerificationType: EmailVerificationType.twoFA,
  //         user: user,
  //         token: token ?? "",
  //         password: password,
  //       ),
  //     );
  //     return;
  //   }

  //   UserProvider userProvider =
  //       Provider.of<UserProvider>(context, listen: false);
  //   userProvider.updateUser(user);
  //   Navigator.pushNamedAndRemoveUntil(context, RoutesManager.dashboardWrapper,
  //       (Route<dynamic> route) => false);
  // }

  // static Future<User> setPin(String pin) async {
  //   http.Response response =
  //       await HttpRequest.post("/auth/pin/set", {"pin": pin}).catchError((err) {
  //     throw OtherErrors(err);
  //   });

  //   Map res = {};
  //   try {
  //     res = json.decode(response.body);
  //   } catch (_) {}

  //   if (response.statusCode == 200) {
  //     return User.fromMap(res["data"]["user"]);
  //   } else {
  //     throw throwHttpError(res);
  //   }
  // }

  static Future<void> logout(BuildContext context,
      {bool deactivateTokenAndRestart = false}) async {
    await (await SecureStorage.getInstance()).clearMemory();
    // await HttpRequest.clearMemory();

    if (deactivateTokenAndRestart) {
      // CALL LOGOUT ENDPOINT
      // ignore: use_build_context_synchronously
      MyApp.restartApp(context);
    }
  }

  static Future<String> completePasswordReset(
      {required String email,
      required String otp,
      required String password}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return "Password reset successful";
  }

  // static Future<String> updateTransactionPin(
  //     {required String old_pin, required String new_pin}) async {
  //   Map<String, dynamic> body = {"pin": new_pin, "old_pin": old_pin};

  //   http.Response response =
  //       await HttpRequest.post("/auth/pin/update", body).catchError((err) {
  //     throw OtherErrors(err);
  //   });

  //   Map res = {};
  //   try {
  //     res = json.decode(response.body);
  //   } catch (_) {}

  //   if (response.statusCode == 200) return throwHttpError(res);

  //   throw throwHttpError(res);
  // }

  // static Future<User> toggleBiometric(String type) async {
  //   http.Response response =
  //       await HttpRequest.post("/auth/biometric/$type", {}).catchError((err) {
  //     throw OtherErrors(err);
  //   });

  //   Map res = {};
  //   try {
  //     res = json.decode(response.body);
  //   } catch (_) {}

  //   if (response.statusCode == 200) {
  //     await updateBiometricToken(res["data"]['biometric_token']);
  //     return User.fromMap(res["data"]);
  //   } else {
  //     throw throwHttpError(res);
  //   }
  // }

  // static updateSavedUserDetails(User user) async {
  //   try {
  //     _prefs ??= await SecureStorage.getInstance();

  //     var encoded = _prefs!.getString("authCred");
  //     var decodedDt = json.decode(encoded!);

  //     decodedDt["user"] = user.toMap();
  //     _prefs!.setString("authCred", json.encode(decodedDt));
  //   } catch (_) {
  //     print("Error $_");
  //   }
  // }

  // static Future<User> completeTwoFa(
  //     {required String code,
  //     required String email,
  //     required String password}) async {
  //   http.Response response = await HttpRequest.post(
  //       "/auth/2fa/verify", {"email": email, "token": code}).catchError((err) {
  //     throw OtherErrors(err);
  //   });

  //   Map res = {};
  //   try {
  //     res = json.decode(response.body);
  //   } catch (_) {}

  //   if (response.statusCode == 200) {
  //     await _saveLoginCred(
  //       loginProvider: LoginProvider.password,
  //       user_token: null,
  //       password: password,
  //       email: email,
  //       user: res["data"]["user"],
  //       token: res["data"]["token"],
  //       biometric_token: res["data"]["biometric_token"],
  //     );

  //     return User.fromMap(res["data"]["user"]);
  //   } else {
  //     throw throwHttpError(res);
  //   }
  // }
}
