import 'package:flutter/material.dart';

import '../../misc/color_manager/color_manager.dart';
import '../../misc/image_manager/image_manager.dart';
import '../../misc/route_manager/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1800));
      Navigator.pushNamed(context, RoutesManager.signIn);
    });
    super.initState();
  }

  Future<void> checkAuth() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 150),
      color: ColorManager.kPrimaryLight,
      child: Center(child: Image.asset(ImageManager.kSplashImage, width: 280)),
    );
  }
}
