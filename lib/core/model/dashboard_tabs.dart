import 'dart:io';

import 'package:flutter/material.dart';

import '../../presentation/misc/color_manager/color_manager.dart';
import '../../presentation/misc/image_manager/image_manager.dart';
import '../../presentation/screens/dashboard/home/home_tab.dart';
import '../../presentation/screens/dashboard/feed/feed_tab.dart';
import '../../presentation/screens/dashboard/settings/settings_tab.dart';
import '../utils/enum.dart';

class DashboardTabsItems {
  final String name;
  final String inactiveUrl;
  final double height;
  final double width;
  final DashboardTabs dashboardTabs;

  DashboardTabsItems(
      {required this.name,
      required this.inactiveUrl,
      required this.height,
      required this.width,
      required this.dashboardTabs});

  static List<DashboardTabsItems> data = [
    DashboardTabsItems(
      name: "Home",
      inactiveUrl: ImageManager.kHomeTab,
      width: 24,
      height: 24,
      dashboardTabs: DashboardTabs.home,
    ),
    DashboardTabsItems(
      name: "Feed",
      inactiveUrl: ImageManager.kFeedTab,
      width: 24,
      height: 24,
      dashboardTabs: DashboardTabs.feed,
    ),
    DashboardTabsItems(
      name: "Settings",
      inactiveUrl: ImageManager.kSettingsTab,
      width: 24,
      height: 24,
      dashboardTabs: DashboardTabs.settings,
    ),
  ];

  static Widget renderCurrentPage(DashboardTabs tabs) {
    switch (tabs) {
      case DashboardTabs.home:
        return const HomeTab();
      case DashboardTabs.feed:
        return const FeedTab();
      case DashboardTabs.settings:
        return const SettingsTab();
      default:
        return const SizedBox();
    }
  }

  //

  static Color getBottomBarColor(DashboardTabs tabs) {
    return ColorManager.kWhite;
  }

  static double getBottomSheetHieght(BuildContext context) =>
      (Platform.isIOS && MediaQuery.of(context).size.height <= 740) ? 58 : 78;
  static double getDasboardTabTopPadding = 20;
}
