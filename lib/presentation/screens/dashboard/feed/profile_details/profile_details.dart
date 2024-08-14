import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twik/presentation/misc/color_manager/color_manager.dart';
import 'package:twik/presentation/misc/custom_scaffold/custom_scaffold.dart';

import '../../../../misc/custom_buttons/custom_btn.dart';
import '../../../../misc/style_manager/text_style_manager.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Container(
        color: Colors.black.withOpacity(.05),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            //
            Container(
              margin: const EdgeInsets.fromLTRB(0, 60, 0, 10),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: .5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.05),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 40, bottom: 15),
                        height: 150,
                        width: 150,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          border: Border.all(
                            width: 2,
                            color: ColorManager.kPrimary,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(75),
                          child: Image.network(
                            "https://pbs.twimg.com/media/GGiY6gLbwAEW6nF?format=jpg&name=large",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //
                      GestureDetector(
                        // onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.05),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(Icons.settings),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Darell Stewward",
                        style: TextStyleManager.get20TextStyle()
                            .copyWith(fontWeight: FontWeight.w700, height: 1),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: ColorManager.kPrimary,
                        size: 18,
                      )
                    ],
                  ),
                  const SizedBox(height: 3.5),
                  Text(
                    "darellstewward@gmail.com",
                    textAlign: TextAlign.center,
                    style: TextStyleManager.get14TextStyle().copyWith(
                        color: ColorManager.kFormHintText, height: 1.10),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            //
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 50,
                    text: "",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.person_add_solid,
                            size: 20, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          "Follow",
                          style: TextStyleManager.get16TextStyle()
                              .copyWith(color: Colors.white),
                        )
                        //

                        //
                      ],
                    ),
                    isActive: true,
                    onTap: () {},
                    loading: false,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomButton(
                    backgroundColor: Colors.white,
                    height: 50,
                    text: "",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.chat_bubble_2_fill, size: 22),
                        const SizedBox(width: 10),
                        Text(
                          "Message",
                          style: TextStyleManager.get16TextStyle(),
                        )
                      ],
                    ),
                    isActive: true,
                    onTap: () {},
                    loading: false,
                  ),
                ),

                //
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: buildStatsCard(title: "Followers", val: "9.7K")),
                  const SizedBox(width: 5),
                  Expanded(child: buildStatsCard(title: "Likes", val: "132k")),
                  const SizedBox(width: 5),
                  Expanded(child: buildStatsCard(title: "Views", val: "96k")),
                ],
              ),
            ),

            //
            Expanded(
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.only(),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              buildImageCard(
                                  "https://pbs.twimg.com/media/GGiZBqXWUAAKBqh?format=jpg&name=small",
                                  height: 240),
                              const SizedBox(height: 5),
                              buildImageCard(
                                  "https://pbs.twimg.com/media/GGiY9QlXkAAVCBb?format=jpg&name=small",
                                  height: 240),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            children: [
                              buildImageCard(
                                  "https://pbs.twimg.com/media/GGiZCWwWcAAnCZL?format=jpg&name=small",
                                  height: 180),
                              const SizedBox(height: 5),
                              buildImageCard(
                                  "https://pbs.twimg.com/media/GT9jiKSXgAArnlp?format=jpg&name=small",
                                  height: 180),
                              const SizedBox(height: 5),
                              buildImageCard(
                                  "https://pbs.twimg.com/media/GGiZFQdXIAAFfWO?format=jpg&name=small",
                                  height: 180),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  //

                  //
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget buildStatsCard({required String title, required String val}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(val,
              style: TextStyleManager.get28TextStyle()
                  .copyWith(fontWeight: FontWeight.w700)),
          //
          Text(title,
              style: TextStyleManager.get12TextStyle()
                  .copyWith(color: ColorManager.kTextDark7)),
        ],
      ),
    );
  }

  Widget buildImageCard(String imgUrl, {required double height}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: const EdgeInsets.only(right: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(.5),
          ),
          padding: const EdgeInsets.all(8.0),
          child: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ),
    );
  }
}
