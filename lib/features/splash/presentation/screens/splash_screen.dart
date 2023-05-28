import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/theme/theme_cubit/theme_cubit.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
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
      () => context.pushReplacement("/${Routes.getStartedRoute}"));

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: !instance<ThemeCubit>().isThemeDark
            ? ColorManager.white
            : ColorManager.primary,
        body: Center(
          child: Container(
            alignment: Alignment.center,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: instance<ThemeCubit>().isThemeDark
                  ? ColorManager.white
                  : null,
            ),
            child: WidgetAnimator(
              atRestEffect: WidgetRestingEffects.size(),
              child: Image.asset(
                ImageAssets.appLogo,
                height: 150,
                width: 150,
              ),
            ),
          ),
        ),
      );
}
