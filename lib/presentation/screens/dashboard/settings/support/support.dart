import 'package:flutter/material.dart';

import 'package:twik/presentation/misc/style_manager/text_style_manager.dart';

import '../../../../misc/color_manager/color_manager.dart';
import '../../../../misc/custom_back_icon/custom_back_icon.dart';
import '../../../../misc/custom_container/custom_container.dart';
import '../../../../misc/custom_elements/custom_divider.dart';
import '../../../../misc/custom_scaffold/custom_scaffold.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final spacer = const SizedBox(height: 30);

  ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                          flex: 1,
                          child: Text(
                            "Support",
                            textAlign: TextAlign.center,
                            style: TextStyleManager.get18TextStyle(),
                          ),
                        ),
                        const Expanded(flex: 1, child: SizedBox()),
                      ],
                    ),

                    //

                    //
                    customDivider(
                        height: 1,
                        margin: const EdgeInsets.only(top: 16, bottom: 26)),

                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async => () {},
                        child: ListView(
                          controller: controller,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          children: [
                            //
                            CustomContainer(
                              onTap: () {},
                              padding: const EdgeInsets.all(20),
                              borderRadiusSize: 32,
                              child: Row(
                                children: [
                                  //
                                  Icon(Icons.call,
                                      color: ColorManager.kPrimary),
                                  const SizedBox(width: 11),

                                  //
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Call us",
                                            style: TextStyleManager
                                                    .get14TextStyle()
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        Text("+1 223-333-333",
                                            style: TextStyleManager
                                                .get12TextStyle()),
                                      ],
                                    ),
                                  ),

                                  Icon(Icons.chevron_right,
                                      color: ColorManager.kBarColor)
                                ],
                              ),
                            ),

                            CustomContainer(
                              onTap: () {},
                              padding: const EdgeInsets.all(20),
                              borderRadiusSize: 32,
                              child: Row(
                                children: [
                                  Icon(Icons.mail,
                                      color: ColorManager.kPrimary),
                                  const SizedBox(width: 11),

                                  //
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Send us a mail",
                                            style: TextStyleManager
                                                    .get14TextStyle()
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        Text("support@domain.com",
                                            style: TextStyleManager
                                                .get12TextStyle()),
                                      ],
                                    ),
                                  ),

                                  Icon(Icons.chevron_right,
                                      color: ColorManager.kBarColor)
                                ],
                              ),
                            ),

                            CustomContainer(
                              onTap: () {},
                              padding: const EdgeInsets.all(20),
                              borderRadiusSize: 32,
                              child: Row(
                                children: [
                                  //
                                  Icon(Icons.chat,
                                      color: ColorManager.kPrimary),
                                  const SizedBox(width: 11),

                                  //
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Chat with us on whatsapp",
                                            style: TextStyleManager
                                                    .get14TextStyle()
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        Text(
                                          "+1 333-333-333",
                                          style:
                                              TextStyleManager.get12TextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Icon(Icons.chevron_right,
                                      color: ColorManager.kBarColor)
                                ],
                              ),
                            ),

                            //
                            const SizedBox(height: 50),
                          ],
                        ),
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
}
