import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_configurations/scroll_behavior.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/theme/styles_manager.dart';
import 'package:dr_purple/app/app_management/theme/theme_cubit/theme_cubit.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
import 'package:dr_purple/core/widgets/buttons/dr_purple_app_button.dart';
import 'package:dr_purple/core/widgets/buttons/dr_purple_back_button.dart';
import 'package:dr_purple/core/widgets/text_fields/dr_purple_verification_code_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import 'package:responsive_sizer/responsive_sizer.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: _screenContent(context),
      );

  Widget _screenContent(BuildContext context) => Stack(
        children: [
          _verifyAccountDataView(context),
          _backButton(),
        ],
      );

  Widget _verifyAccountDataView(BuildContext context) => Container(
        padding: EdgeInsets.only(top: AppPadding.p3.h),
        height: context.height(),
        decoration: nb.boxDecorationWithRoundedCorners(
            backgroundColor: context.cardColor),
        child: ScrollConfiguration(
          behavior: StretchScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: AppSize.s7.h),
                _verifyAccountImage(),
                ..._verifyAccountTitle(),
                DrPurpleVerificationCodeTextField(
                  onChange: (val) {},
                  itemSize: AppSize.s30.sp,
                  length: 6,
                ),
                SizedBox(height: AppSize.s3.h),
                _confirmVerifyAccountCode(),
              ],
            ).paddingAll(AppPadding.p18.sp),
          ),
        ),
      );

  Widget _verifyAccountImage() => Container(
        margin: EdgeInsets.only(top: AppPadding.p2.h),
        padding: EdgeInsets.all(AppPadding.p18.sp),
        child: Image.asset(
          ImageAssets.verifyAccountImage,
          alignment: Alignment.centerLeft,
          width: 200,
          height: 200,
        ),
      );

  Widget _confirmVerifyAccountCode() => Column(
        children: [
          _resendCode(),
          SizedBox(height: AppSize.s3.h),
          DrPurpleAppButton(
            title: AppStrings.confirm.tr(),
            onPress: () => GoRouter.of(context)
              ..pop()
              ..pushReplacement("/${Routes.homeRoute}"),
          ),
        ],
      );

  Widget _resendCode() => Row(
        children: [
          Text(
            AppStrings.noCodeQuestion.tr(),
            style: getRegularTextStyle(
              color: ColorManager.textPrimaryColor,
              fontSize: FontSize.s16,
            ),
          ),
          SizedBox(width: AppSize.s2.w),
          Text(
            AppStrings.resend.tr(),
            style: getBoldTextStyle(
              fontSize: FontSize.s16,
              color: ColorManager.primary,
              textDecoration: TextDecoration.underline,
            ),
          ).onTap(() async => await instance<ThemeCubit>().toggleTheme()),
          const Text("01:58", textAlign: TextAlign.right).expand()
        ],
      );

  List<Widget> _verifyAccountTitle() => [
        SizedBox(height: AppSize.s4.h),
        Text(
          AppStrings.verifyAccount.tr(),
          style: getBoldTextStyle(
            fontSize: FontSize.s24,
            color: ColorManager.textPrimaryColor,
          ),
        ),
        SizedBox(height: AppSize.s1.h),
        Text(
          AppStrings.codeDesc.tr(),
          style: getRegularTextStyle(
            color: ColorManager.textSecondaryColor,
            fontSize: FontSize.s14,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSize.s2.h),
      ];

  Widget _backButton() => Positioned(
        top: 30,
        child: DrPurpleBackButton(
          color: instance<ThemeCubit>().isThemeDark
              ? ColorManager.white
              : ColorManager.black,
        ),
      );
}
