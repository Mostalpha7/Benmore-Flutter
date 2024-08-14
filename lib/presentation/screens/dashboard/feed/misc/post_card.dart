import 'package:flutter/cupertino.dart';
import 'package:twik/presentation/misc/color_manager/color_manager.dart';
import 'package:twik/presentation/misc/route_manager/routes_manager.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../misc/custom_elements/custom_elements.dart';
import '../../../../misc/image_manager/image_manager.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pushNamed(context, RoutesManager.profileDetails);
            },
            child: SizedBox(
              height: 40,
              width: 40,
              child: loadNetworkImage(
                "",
                errorDefaultImage: ImageManager.kProfileFallBack,
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(width: 12),

          ///
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Marvin McKinney",
                  style: TextStyleManager.get16TextStyle(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Text(
                      "Finally! Congratulation on completing the project.",
                      style: TextStyleManager.get14TextStyle()),
                ),

                RichText(
                  text: TextSpan(
                    style: TextStyleManager.get14TextStyle().copyWith(
                        color: ColorManager.kTextColor.withOpacity(.5)),
                    children: [
                      const TextSpan(text: "today at 6:41"),
                      TextSpan(
                        text: "  Reply",
                        style: TextStyle(
                          color: ColorManager.kPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                //
              ],
            ),
          ),

          ///

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 13.5, right: 10, bottom: 8),
              child: Row(
                children: [
                  Icon(CupertinoIcons.suit_heart,
                      color: ColorManager.kTextDark, size: 18),
                  Text(
                    "  173",
                    style: TextStyleManager.get14TextStyle()
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),

          ///
        ],
      ),
    );
  }
}
