import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../misc/color_manager/color_manager.dart';
import '../../../../misc/custom_elements/custom_divider.dart';
import '../../../../misc/route_manager/routes_manager.dart';
import '../../../../misc/style_manager/text_style_manager.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(context, RoutesManager.notificationDetail);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.kHorizontalScreenPadding, vertical: 10),
        color: false ? null : ColorManager.kNotificationUnread,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44,
              width: 44,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: ColorManager.kPrimaryLight,
              ),
              child: Icon(CupertinoIcons.bell_fill,
                  size: 18, color: ColorManager.kPrimary),
            ),

            //
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Yemi Just Tagged You",
                      style: TextStyleManager.get16TextStyle()
                          .copyWith(fontWeight: FontWeight.w400)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing...",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleManager.get14TextStyle().copyWith(
                          color: ColorManager.kTextDark7, height: 1.1),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "12-05-2024",
                        style: TextStyleManager.get14TextStyle().copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorManager.kTextDark7,
                        ),
                      ),
                      customDivider(
                        width: .5,
                        height: 13,
                        color: ColorManager.kBarColor,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                      ),
                      Text(
                        "10:05am",
                        style: TextStyleManager.get14TextStyle().copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorManager.kTextDark7,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
