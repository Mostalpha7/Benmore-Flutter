import 'package:flutter/material.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../misc/color_manager/color_manager.dart';
import '../../../misc/custom_back_icon/custom_back_icon.dart';

import '../../../misc/custom_elements/custom_divider.dart';
import '../../../misc/custom_scaffold/custom_scaffold.dart';
import 'misc/notification_tile.dart';

class AllNotifications extends StatefulWidget {
  const AllNotifications({super.key});

  @override
  State<AllNotifications> createState() => _AllNotificationsState();
}

class _AllNotificationsState extends State<AllNotifications> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: ColorManager.kPrimaryLight,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.kWhite,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 15),
                      child: const BackIcon(),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text("Notification",
                          textAlign: TextAlign.center,
                          style: TextStyleManager.get18TextStyle())),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              ),
              customDivider(height: 1, margin: const EdgeInsets.only(top: 16)),
              Expanded(
                child: RefreshIndicator(
                  color: ColorManager.kPrimary,
                  onRefresh: () async => () {},
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: controller,
                    padding: const EdgeInsets.only(bottom: 30, top: 25),
                    itemCount: 5,
                    itemBuilder: (__, int i) => const NotificationTile(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
