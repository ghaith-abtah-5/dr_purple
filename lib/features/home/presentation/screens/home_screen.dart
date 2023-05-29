import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorManager.primary,
        body: _screenContent(context),
      );

  Widget _screenContent(BuildContext context) => Stack(
        children: [
          _loginImage(context),
        ],
      );

  Widget _loginImage(BuildContext context) => Container(
        margin: EdgeInsets.only(top: AppPadding.p10.h),
        width: context.width(),
        child: Image.asset(
          ImageAssets.authImage,
          alignment: Alignment.center,
          width: AppSize.s50.w,
          height: AppSize.s25.h,
        ),
      );
}
