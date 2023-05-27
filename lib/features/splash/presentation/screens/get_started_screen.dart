import 'package:dr_purple/app/app_management/color_manager.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/language_manager/language_manager.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/styles_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
import 'package:dr_purple/features/splash/data/local/data_sources/get_started_local_data_source.dart';
import 'package:dr_purple/features/splash/data/local/models/get_started_screen_model/get_started_screen_model.dart';
import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  late final PageController _pageController;
  late final List<GetStartedScreenModel> _screenData;

  _bind() {
    _pageController = PageController();
    _screenData = GetStartedLocalDataSource().getStartedScreenData();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorManager.primary,
        body: _screenContent(),
      );

  Widget _screenContent() => Stack(
        children: [
          _pages(),
          _dotsAndButton(),
          _skipButton(),
        ],
      );

  Widget _pages() => PageView(
        controller: _pageController,
        children: _screenData.map((e) => _pageViewContent(e)).toList(),
      );

  Widget _pageViewContent(GetStartedScreenModel pageContent) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purpleAccent, Colors.purple.shade600],
              ),
            ),
            height: AppSize.s35.h,
            width: AppSize.s60.w,
            child: Image.asset(pageContent.imagePath, fit: BoxFit.contain),
          ),
          SizedBox(height: AppSize.s2.h),
          Text(
            pageContent.title.tr(),
            textAlign: TextAlign.center,
            style: getBoldTextStyle(
              color: ColorManager.white,
              fontSize: FontSize.s24,
            ),
          ),
          SizedBox(height: AppSize.s2.h),
          Text(
            pageContent.subtitle.tr(),
            style: getRegularTextStyle(
              fontSize: FontSize.s14,
              color: ColorManager.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingAll(AppPadding.p2.sp);

  Widget _dotsAndButton() => Positioned.directional(
        bottom: 30,
        start: 16,
        end: 16,
        textDirection: instance<LanguageManager>().isArabic
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DotIndicator(
              pageController: _pageController,
              pages: _screenData,
            ),
            AppButton(
              onTap: () => context.replace("/${Routes.loginRoute}"),
              color: ColorManager.white,
              child: Text(
                AppStrings.getStarted.tr(),
                textAlign: TextAlign.center,
                style: getBoldTextStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s16,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _skipButton() => Positioned.directional(
        top: 40,
        end: 16,
        textDirection: instance<LanguageManager>().isArabic
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: TextButton(
          onPressed: () => context.replace("/${Routes.loginRoute}"),
          child: Text(
            AppStrings.skip.tr(),
            textAlign: TextAlign.center,
            style: getBoldTextStyle(
              color: ColorManager.white,
              fontSize: FontSize.s16,
            ),
          ),
        ),
      );
}
