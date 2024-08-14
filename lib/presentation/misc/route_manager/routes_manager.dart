import 'package:flutter/material.dart';

import '../../../core/utils/enum.dart';
import '../../screens/auth/password_reset/misc/password_reset_3_arg.dart';
import '../../screens/auth/password_reset/password_reset_1.dart';
import '../../screens/auth/password_reset/password_reset_3.dart';
import '../../screens/auth/signin/signin.dart';
import '../../screens/auth/signup/signup.dart';
import '../../screens/auth/signup/verify_email.dart';
import '../../screens/dashboard/dashboard_wrapper.dart';
import '../../screens/dashboard/feed/profile_details/profile_details.dart';
import '../../screens/dashboard/notification/all_notifications.dart';
import '../../screens/dashboard/notification/notification_detail.dart';
import '../../screens/dashboard/settings/change_password/change_password.dart';
import '../../screens/dashboard/settings/profile_settings.dart/profile_settings.dart';
import '../../screens/dashboard/settings/support/support.dart';

class RoutesManager {
  static const String signIn = "/signIn";

  static const String signUp = "/signUp";
  static const String verifyEmail = "/verifyEmail";

  static const String passwordReset1 = "/passwordReset1";
  static const String passwordReset3 = "/passwordReset3";

  static const String dashboardWrapper = "/dashboardWrapper";
  static const String allNotifications = "/allNotifications";
  static const String notificationDetail = "/notificationDetail";

  static const String support = "/support";
  static const String changePassword = "/changePassword";
  static const String profileSettings = "/profileSettings";

  static const String profileDetails = "/profileDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.signIn:
        return MaterialPageRoute(builder: (_) => SignIn());
      case RoutesManager.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case RoutesManager.verifyEmail:
        return MaterialPageRoute(
          builder: (_) => VerifyEmail(
            emailVerificationType: settings.arguments as EmailVerificationType,
          ),
        );

      case RoutesManager.passwordReset1:
        return MaterialPageRoute(builder: (_) => const PasswordReset1());

      case RoutesManager.passwordReset3:
        return MaterialPageRoute(
          builder: (_) =>
              PasswordReset3(param: settings.arguments as PasswordReset3Arg),
        );

      case RoutesManager.dashboardWrapper:
        return MaterialPageRoute(builder: (_) => const DashboardWrapper());

      case RoutesManager.allNotifications:
        return MaterialPageRoute(builder: (_) => const AllNotifications());
      case RoutesManager.notificationDetail:
        return MaterialPageRoute(builder: (_) => const NotificationDetail());

      case RoutesManager.support:
        return MaterialPageRoute(builder: (_) => const Support());
      case RoutesManager.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePassword());
      case RoutesManager.profileSettings:
        return MaterialPageRoute(builder: (_) => const ProfileSettings());
      case RoutesManager.profileDetails:
        return MaterialPageRoute(builder: (_) => const ProfileDetails());

      //
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("404")),
        body: const Center(
          child: Text("404 Page Not Found"),
        ),
      ),
    );
  }
}
