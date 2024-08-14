import 'package:flutter/material.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../../core/helpers/auth_helper.dart';
import '../../../../misc/color_manager/color_manager.dart';
import '../../../../misc/custom_back_icon/custom_back_icon.dart';
import '../../../../misc/custom_buttons/custom_btn.dart';
import '../../../../misc/custom_elements/custom_divider.dart';

class LogoutConfirmation extends StatelessWidget {
  const LogoutConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                const BackIcon(),
                const SizedBox(width: 15),
                Text(
                  "Go Back",
                  style: TextStyleManager.get14TextStyle(),
                ),
              ],
            ),
          ),
          customDivider(),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 25, left: 15),
            child: Text(
              "Are you sure you want\nto logout?",
              textAlign: TextAlign.left,
              style: TextStyleManager.get22TextStyle(),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomButton(
              text: "Yes, Logout",
              isActive: true,
              onTap: () async {
                AuthHelper.logout(context, deactivateTokenAndRestart: true);
              },
              loading: false,
              backgroundColor: ColorManager.kPrimary,
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
