import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twik/core/utils/enum.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../core/model/dashboard_tabs.dart';
import '../../../core/providers/generic_provider.dart';
import '../../misc/color_manager/color_manager.dart';
import '../../misc/custom_elements/custom_elements.dart';
import '../../misc/custom_scaffold/custom_scaffold.dart';
import '../../misc/image_manager/image_manager.dart';
import '../../misc/notification_bell/notification_bell.dart';

class DashboardWrapper extends StatefulWidget {
  const DashboardWrapper({Key? key}) : super(key: key);

  @override
  _DashboardWrapperState createState() => _DashboardWrapperState();
}

class _DashboardWrapperState extends State<DashboardWrapper> {
  final List<DashboardTabsItems> pages = DashboardTabsItems.data;

  @override
  Widget build(BuildContext context) {
    GenericProvider genericProvider = Provider.of<GenericProvider>(context);

    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (genericProvider.currentPage != DashboardTabs.feed)
              Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 15),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: ColorManager.kBarColor.withOpacity(.5),
                        width: 1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: loadNetworkImage(
                            "",
                            errorDefaultImage: ImageManager.kProfileFallBack,
                            height: 35,
                            width: 35,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),

                        const SizedBox(width: 11),
                        //
                        Text(
                          "Donald",
                          style: TextStyleManager.get16TextStyle()
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        const CustomNotificationBell()
                      ],
                    ),

                    //
                  ],
                ),
              ),
            Expanded(
              child: Container(
                child: DashboardTabsItems.renderCurrentPage(
                    genericProvider.currentPage),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: DashboardTabsItems.getBottomBarColor(
            genericProvider.currentPage,
          ),
          border: Border(
              top: BorderSide(
                  color: ColorManager.kBarColor.withOpacity(.5), width: 1)),
        ),
        padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom:
                (Platform.isIOS && MediaQuery.of(context).size.height <= 740)
                    ? 3
                    : 13,
            top: 0),
        height: DashboardTabsItems.getBottomSheetHieght(context),
        margin: const EdgeInsets.only(bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: pages.map((e) {
            bool active = genericProvider.currentPage == e.dashboardTabs;
            return Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (active) return;
                  genericProvider.updatePage(e.dashboardTabs);
                },
                behavior: HitTestBehavior.translucent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      e.inactiveUrl,
                      width: e.width,
                      height: e.height,
                      color: active
                          ? ColorManager.kPrimary
                          : ColorManager.kTextDark,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      e.name,
                      style: TextStyleManager.get12TextStyle().copyWith(
                        fontWeight: active ? FontWeight.w500 : FontWeight.w400,
                        color: active
                            ? ColorManager.kPrimary
                            : ColorManager.kTextDark,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
