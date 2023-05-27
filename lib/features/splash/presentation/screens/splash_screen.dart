import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_management/color_manager.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateTest();
  }

  navigateTest() async => Future.delayed(AppDurations.megaSuperSlow,
      () => context.replace("/${Routes.getStartedRoute}"));

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorManager.white,
        body: Center(
          child: WidgetAnimator(
            atRestEffect: WidgetRestingEffects.size(),
            child: Image.asset(
              ImageAssets.appLogo,
              height: 150,
              width: 150,
            ),
          ),
        ),
      );
}
