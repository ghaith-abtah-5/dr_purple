import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_configurations/scroll_behavior.dart';
import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/theme/styles_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/core/widgets/buttons/dr_purple_app_button.dart';
import 'package:dr_purple/core/widgets/text_fields/dr_purple_email_text_field.dart';
import 'package:dr_purple/core/widgets/text_fields/dr_purple_password_text_field.dart';
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
  late final TextEditingController _emailTextEditingController,
      _passwordTextEditingController;

  final _formKey = GlobalKey<FormState>();

  _bind() {
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  _disposeControllers() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

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

  Widget _loginMainView() => Form(
        key: _formKey,
        child: Column(
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
        ).paddingSymmetric(horizontal: AppSize.s4.w),
      );

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
          ).onTap(() => context.pushReplacement("/${Routes.registerRoute}")),
        ],
      );

  Widget _loginButton() => DrPurpleAppButton(
        onPress: () {},
        title: AppStrings.login.tr(),
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
        ).onTap(() => context.push(
            "${GoRouter.of(context).location}/${Routes.forgotPasswordRoute}")),
      );

  Widget _passwordTextField() => DrPurplePasswordTextField(
        passwordTextEditingController: _passwordTextEditingController,
        formKey: _formKey,
      );

  Widget _emailTextField() => DrPurpleEmailTextField(
        emailTextEditingController: _emailTextEditingController,
        formKey: _formKey,
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
