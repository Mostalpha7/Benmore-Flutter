import 'package:flutter/material.dart';

import '../color_manager/color_manager.dart';
import '../route_manager/routes_manager.dart';

class CustomNotificationBell extends StatelessWidget {
  final double? size;
  final Color? borderColor;
  final Color? iconColor;
  final Color? bgColor;

  const CustomNotificationBell(
      {super.key, this.size, this.borderColor, this.iconColor, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        await Navigator.pushNamed(context, RoutesManager.allNotifications);
      },
      child: Stack(
        children: [
          Icon(Icons.notifications,
              size: size ?? 25, color: iconColor ?? ColorManager.kTextDark),
          const SizedBox(height: 10, width: 30),
          if (true)
            Positioned(
              top: 0,
              right: 3.5,
              child: Container(
                height: 9,
                width: 9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: iconColor ?? ColorManager.kBarColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
