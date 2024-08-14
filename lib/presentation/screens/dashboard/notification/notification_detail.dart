import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../core/constants/constants.dart';
import '../../../misc/color_manager/color_manager.dart';
import '../../../misc/custom_back_icon/custom_back_icon.dart';
import '../../../misc/custom_elements/custom_divider.dart';
import '../../../misc/custom_scaffold/custom_scaffold.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({super.key});

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  final spacer = const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: ColorManager.kPrimaryLight,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Expanded(
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
                            padding: const EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            child: const BackIcon(),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              //
                              Text("Message",
                                  textAlign: TextAlign.center,
                                  style: TextStyleManager.get18TextStyle()),
                            ],
                          ),
                        ),
                        const Expanded(flex: 1, child: SizedBox()),
                      ],
                    ),

                    //

                    //
                    customDivider(
                      height: 1,
                      margin: const EdgeInsets.only(top: 16, bottom: 24),
                      color: ColorManager.kBarColor,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.kHorizontalScreenPadding),
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
                                Text("Yemisi Just Posted",
                                    style: TextStyleManager.get16TextStyle()
                                        .copyWith(fontWeight: FontWeight.w400)),
                                Row(
                                  children: [
                                    Text(
                                      "12-05-2024",
                                      style: TextStyleManager.get14TextStyle()
                                          .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.kTextDark7,
                                      ),
                                    ),
                                    customDivider(
                                      width: .5,
                                      height: 13,
                                      color: ColorManager.kBarColor,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                    ),
                                    Text(
                                      "10:05am",
                                      style: TextStyleManager.get14TextStyle()
                                          .copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.kTextDark7,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //
                        ],
                      ),
                    ),

                    const SizedBox(height: 9),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.",
                            style: TextStyleManager.get14TextStyle()
                                .copyWith(height: 1.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile(String text, {EdgeInsetsGeometry? margin}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        //
      },
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorManager.kBarColor),
          borderRadius: BorderRadius.circular(19),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(text,
                  style: TextStyleManager.get14TextStyle()
                      .copyWith(fontWeight: FontWeight.w500)),
            ),
            Icon(Icons.chevron_right, color: ColorManager.kBarColor)
          ],
        ),
      ),
    );
  }
}
