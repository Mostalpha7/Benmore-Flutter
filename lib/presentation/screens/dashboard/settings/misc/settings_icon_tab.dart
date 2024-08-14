import 'package:flutter/material.dart';
import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../misc/color_manager/color_manager.dart';

class SettingsIconTab extends StatelessWidget {
  final String? text;
  final String? desc;
  final IconData icon;
  final Function onTap;
  const SettingsIconTab(
      {super.key,
      this.text,
      this.desc,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10, right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: ColorManager.kPrimaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
                child: Icon(icon, size: 28, color: ColorManager.kPrimary)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text ?? "",
                      style: TextStyleManager.get14TextStyle()
                          .copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(desc ?? "", style: TextStyleManager.get12TextStyle()),
                ],
              ),
            ),
          ),

          //
          Icon(Icons.chevron_right_sharp,
              size: 30, color: ColorManager.kTextDark7)
        ],
      ),
    );
  }
}
