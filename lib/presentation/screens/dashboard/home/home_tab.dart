import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twik/core/utils/util.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/providers/user_provider.dart';
import '../../../misc/color_manager/color_manager.dart';

import '../../../misc/custom_buttons/custom_btn.dart';
import '../../../misc/custom_container/custom_container.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  //
  Future<void> refreshPageInfo(UserProvider userProvider) async {
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    //
    return RefreshIndicator(
      color: ColorManager.kPrimary,
      onRefresh: () => refreshPageInfo(userProvider),
      child: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.kHorizontalScreenPadding),
        children: [
          //

          CustomContainer(
            margin: const EdgeInsets.only(top: 34, bottom: 35),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            header: Text("STATS",
                style: TextStyleManager.get14TextStyle()
                    .copyWith(color: ColorManager.kTextDark.withOpacity(.7))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildStatsCard(title: "Earnings", val: "\$2k"),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: buildStatsCard(title: "Subscribers", val: "10k"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildStatsCard(title: "Followers", val: "10k"),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: buildStatsCard(title: "Following", val: "204"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: buildStatsCard(title: "Views", val: "10k"),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child:
                          buildStatsCard(title: "No. Comments", val: "2,054"),
                    )
                  ],
                ),
              ],
            ),
          ),

          Text('Get \$N150 per Referral',
              style: TextStyleManager.get16TextStyle()),
          const SizedBox(height: 5),
          Text(
            'Copy you Referral Code below',
            style: TextStyleManager.get14TextStyle().copyWith(height: 1.3),
          ),
          CustomContainer(
            margin: const EdgeInsets.only(top: 5),
            borderRadiusSize: 19,
            padding:
                const EdgeInsets.only(left: 16, top: 10, bottom: 14, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("NREA-1020-ZAA", style: TextStyleManager.get14TextStyle()),

                SizedBox(
                  width: 73,
                  child: CustomButton(
                      height: 30,
                      text: "Copy",
                      isActive: true,
                      onTap: () => copyToClipboard(context, "NREA-1020-ZAA"),
                      loading: false),
                ),
                //
              ],
            ),
          ),

          const SizedBox(height: 30)
        ],
      ),
    );
  }

  static Widget buildStatsCard({required String title, required String val}) {
    return CustomContainer(
      onTap: () {},
      padding: const EdgeInsets.all(15),
      borderRadiusSize: 12,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(val,
              style: TextStyleManager.get18TextStyle()
                  .copyWith(fontWeight: FontWeight.w700)),
          //
          Text(title,
              style: TextStyleManager.get12TextStyle()
                  .copyWith(color: ColorManager.kPrimary)),
        ],
      ),
    );
  }
}
