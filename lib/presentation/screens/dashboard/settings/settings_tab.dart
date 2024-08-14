import 'package:flutter/material.dart';
import 'package:twik/presentation/misc/custom_elements/custom_divider.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../core/constants/constants.dart';
import '../../../misc/color_manager/color_manager.dart';
import '../../../misc/custom_bottom_sheet/custom_bottom_sheet.dart';
import '../../../misc/custom_buttons/custom_btn.dart';
import '../../../misc/route_manager/routes_manager.dart';
import 'misc/logout_confirmation.dart';
import 'misc/settings_icon_tab.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Constants.kHorizontalScreenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 30),
            child: Text(
              "Settings",
              style: TextStyleManager.get20TextStyle().copyWith(),
            ),
          ),
          //
          SettingsIconTab(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.profileSettings);
            },
            text: "Profile",
            icon: Icons.person_2,
            desc: "Update your profile information",
          ),
          customDivider(margin: const EdgeInsets.only(bottom: 20, top: 5)),
          SettingsIconTab(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.changePassword);
            },
            text: "Security",
            desc: "Update your security details",
            icon: Icons.lock,
          ),
          customDivider(margin: const EdgeInsets.only(bottom: 20, top: 5)),
          SettingsIconTab(
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.support);
            },
            text: "Support",
            desc: "Reach out to support on your concerns",
            icon: Icons.support_agent_outlined,
          ),

          const Spacer(),
          const SizedBox(height: 15),
          CustomButton(
            boxDecoration: BoxDecoration(
              border: Border.all(color: ColorManager.kError),
              borderRadius: BorderRadius.circular(170),
            ),
            textColor: ColorManager.kError,
            text: "Log Out",
            isActive: true,
            onTap: () {
              showCustomBottomSheet(
                context: context,
                screen: const LogoutConfirmation(),
                isDismissible: true,
              );
            },
            loading: false,
          ),

          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
