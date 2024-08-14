import 'package:flutter/material.dart';

import '../utils/enum.dart';

class GenericProvider with ChangeNotifier {
  DashboardTabs _currentPage = DashboardTabs.feed;
  DashboardTabs get currentPage => _currentPage;
  void updatePage(DashboardTabs e) {
    _currentPage = e;
    notifyListeners();
  }
}
