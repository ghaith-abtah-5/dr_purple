import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_configurations/scroll_behavior.dart';
import 'package:dr_purple/app/app_management/color_manager.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/styles_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorManager.primary,
        body: _screenContent(context),
      );

  Widget _screenContent(BuildContext context) => Stack(
        children: [
          _loginDataView(context),
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

  Widget _loginDataView(BuildContext context) => Container(
        margin: EdgeInsets.only(top: AppSize.s32.h),
        height: context.height(),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radiusOnly(topRight: AppSize.s32),
          backgroundColor: context.cardColor,
        ),
        child: ScrollConfiguration(
          behavior: StretchScrollBehavior(),
          child: SingleChildScrollView(child: _loginMainView()),
        ),
      );

  Widget _loginMainView() => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._loginTitle(),
          _emailTextField(),
          SizedBox(height: AppSize.s2.h),
          _passwordTextField(),
          SizedBox(height: AppSize.s1.h),
          _forgetPasswordClickable(context),
          SizedBox(height: AppSize.s3.h),
          _loginButton(),
          SizedBox(height: AppSize.s3.h),
          _noAccountClickable(context),
          SizedBox(height: AppSize.s4.h),
        ],
      ).paddingSymmetric(horizontal: AppSize.s4.w);

  Widget _noAccountClickable(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.noAccountQuestion.tr(),
            style: getRegularTextStyle(
              fontSize: FontSize.s16,
              color: ColorManager.textSecondaryColor,
            ),
          ),
          SizedBox(width: AppSize.s2.w),
          Text(
            AppStrings.register.tr(),
            style: getBoldTextStyle(
              color: ColorManager.lightPrimary,
              fontSize: FontSize.s16,
              textDecoration: TextDecoration.underline,
            ),
          ).onTap(() => context.replace("/${Routes.registerRoute}")),
        ],
      );

  Widget _loginButton() => AppButton(
        color: ColorManager.primary,
        width: double.infinity,
        onTap: () {},
        child: Text(
          AppStrings.login.tr(),
          style: getBoldTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.white,
          ),
        ),
      );

  Widget _forgetPasswordClickable(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: Text(
          AppStrings.forgotPasswordQuestion.tr(),
          style: getRegularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textSecondaryColor,
            textDecoration: TextDecoration.underline,
          ),
        ).onTap(() {}),
      );

  Widget _passwordTextField() => AppTextField(
        textFieldType: TextFieldType.PASSWORD,
        decoration: InputDecoration(
          labelText: AppStrings.passwordTextFieldLabel.tr(),
          labelStyle: getRegularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textSecondaryColor,
          ),
          prefixIcon: const Icon(
            Icons.lock_outline,
            color: ColorManager.black,

            /// todo check for dark mode
            //appStore.isDarkModeOn
            //  ? ColorManager.white
            //  : ColorManager.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.lightGrey.withOpacity(0.2),
            ),
          ),
        ),
      );

  Widget _emailTextField() => AppTextField(
        textFieldType: TextFieldType.EMAIL,
        decoration: InputDecoration(
          labelText: AppStrings.emailTextFieldLabel.tr(),
          labelStyle: getRegularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textSecondaryColor,
          ),
          prefixIcon: const Icon(
            Icons.email_outlined,
            color: ColorManager.black,

            /// todo check for dark mode
            //appStore.isDarkModeOn
            //  ? ColorManager.white
            //  : ColorManager.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.lightGrey.withOpacity(0.2),
              width: AppSize.s1,
            ),
          ),
        ),
      );

  List<Widget> _loginTitle() => [
        SizedBox(height: AppSize.s3_5.h),
        Text(
          AppStrings.login.tr(),
          style: getBoldTextStyle(
            fontSize: FontSize.s28,
            color: ColorManager.textPrimaryColor,
          ),
        ),
        SizedBox(height: AppSize.s1.h),
        Text(
          AppStrings.loginTitle.tr(),
          style: getRegularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textSecondaryColor,
          ),
        ),
        SizedBox(height: AppSize.s2.h),
      ];
}
