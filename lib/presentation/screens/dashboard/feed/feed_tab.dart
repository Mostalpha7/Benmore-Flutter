import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../misc/color_manager/color_manager.dart';
import '../../../misc/custom_elements/custom_elements.dart';
import '../../../misc/image_manager/image_manager.dart';
import '../../../misc/style_manager/text_style_manager.dart';
import 'misc/post_card.dart';

class FeedTab extends StatefulWidget {
  const FeedTab({super.key});

  @override
  State<FeedTab> createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.05),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 500,
        child: ListView(
          controller: controller,
          children: [
            ///
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: loadNetworkImage(
                    "",
                    errorDefaultImage: ImageManager.kProfileFallBack,
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Darell Stewward",
                            style: TextStyleManager.get18TextStyle().copyWith(
                                fontWeight: FontWeight.w700, height: 1),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            CupertinoIcons.checkmark_seal_fill,
                            color: ColorManager.kPrimary,
                            size: 18,
                          )
                        ],
                      ),
                      Text(
                        "yesterday at 11:30",
                        style: TextStyleManager.get14TextStyle().copyWith(
                            color: ColorManager.kFormHintText, height: 1.10),
                      ),
                    ],
                  ),
                )
              ],
            ),

            ///
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 20),
              height: 400,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://pbs.twimg.com/media/GT9jiKSXgAArnlp?format=jpg&name=medium"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(CupertinoIcons.heart_fill),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(.3),
                            ),
                            width: 45,
                            height: 45,
                            child: const Icon(Icons.more_vert,
                                color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(.3),
                            ),
                            width: 45,
                            height: 45,
                            child: const Icon(CupertinoIcons.chat_bubble_2_fill,
                                color: Colors.white),
                          ),
                        ],
                      )

                      //

                      //
                    ],
                  ),

                  //
                  const Spacer(),
                  Text(
                    "Finished working\non a project",
                    textAlign: TextAlign.center,
                    style: TextStyleManager.get28TextStyle().copyWith(
                      color: Colors.white,
                      height: 1.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDot(false),
                      buildDot(false),
                      buildDot(true),
                      buildDot(false),
                      buildDot(false),
                    ],
                  ),
                  //

                  const SizedBox(height: 20),
                ],
              ),
            ),

            //
            const PostCard(),
            const PostCard(),
            const PostCard(),
            const PostCard(),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget buildDot(bool isActive) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? Colors.white : Colors.white.withOpacity(.25),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 3.5),
        height: isActive ? 10 : 8,
        width: isActive ? 10 : 8,
      );
}
