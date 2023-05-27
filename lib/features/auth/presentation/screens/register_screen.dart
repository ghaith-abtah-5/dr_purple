import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_configurations/scroll_behavior.dart';
import 'package:dr_purple/app/app_management/color_manager.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/styles_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
import 'package:dr_purple/core/utils/constants.dart';
import 'package:dr_purple/core/utils/enums.dart';
import 'package:dr_purple/core/utils/extensions.dart';
import 'package:dr_purple/core/widgets/country_code_picker/src/fl_country_code_picker.dart';
import 'package:dr_purple/features/auth/presentation/bloc/country_code_cubit/country_code_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final FlCountryCodePicker _countryPicker;
  late final CountryCodeCubit _countryCodeCubit;

  _bind() {
    _countryCodeCubit = instance<CountryCodeCubit>();
    _countryPicker = const FlCountryCodePicker(
        filteredCountries: ["SY"], showSearchBar: false);
  }

  Gender gender = Gender.male;

  @override
  void initState() {
    super.initState();
    _bind();
  }

  _disposeCubit() async => await _countryCodeCubit.close();

  @override
  void dispose() {
    _disposeCubit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorManager.primary,
        body: _screenContent(context),
      );

  Widget _screenContent(BuildContext context) => BlocProvider(
        create: (context) => _countryCodeCubit,
        child: Stack(
          children: [
            _registerDataView(context),
            _registerImage(context),
          ],
        ),
      );

  Widget _registerImage(BuildContext context) => Container(
        margin: EdgeInsets.only(top: AppPadding.p10.h),
        width: context.width(),
        child: Image.asset(
          ImageAssets.authImage,
          alignment: Alignment.center,
          width: AppSize.s50.w,
          height: AppSize.s25.h,
        ),
      );

  Widget _registerDataView(BuildContext context) => Container(
        margin: EdgeInsets.only(top: AppSize.s32.h),
        height: context.height(),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radiusOnly(topRight: AppSize.s32),
          backgroundColor: context.cardColor,
        ),
        child: ScrollConfiguration(
          behavior: StretchScrollBehavior(),
          child: SingleChildScrollView(child: _registerMainView()),
        ),
      );

  Widget _registerMainView() => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._registerTitle(),
          _emailTextField(),
          SizedBox(height: AppSize.s2.h),
          _phoneNumberTextField(context),
          SizedBox(height: AppSize.s2.h),
          _passwordTextField(),
          SizedBox(height: AppSize.s2.h),
          _nameTextFields(),
          SizedBox(height: AppSize.s2.h),
          _addressTextField(),
          SizedBox(height: AppSize.s2.h),
          _genderSelection(),
          SizedBox(height: AppSize.s3.h),
          _registerButton(),
          SizedBox(height: AppSize.s3.h),
          _alreadyHaveAccountClickable(context),
          SizedBox(height: AppSize.s4.h),
        ],
      ).paddingSymmetric(horizontal: AppSize.s4.w);

  Widget _alreadyHaveAccountClickable(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.alreadyHasAccountQuestion.tr(),
            style: getRegularTextStyle(
              fontSize: FontSize.s16,
              color: ColorManager.textSecondaryColor,
            ),
          ),
          SizedBox(width: AppSize.s2.w),
          Text(
            AppStrings.login.tr(),
            style: getBoldTextStyle(
              color: ColorManager.lightPrimary,
              fontSize: FontSize.s16,
              textDecoration: TextDecoration.underline,
            ),
          ).onTap(() => context.replace("/${Routes.loginRoute}")),
        ],
      );

  Widget _registerButton() => AppButton(
        color: ColorManager.primary,
        width: double.infinity,
        onTap: () {},
        child: Text(
          AppStrings.register.tr(),
          style: getBoldTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.white,
          ),
        ),
      );

  Widget _passwordTextField() => AppTextField(
        textFieldType: TextFieldType.PASSWORD,
        textInputAction: TextInputAction.next,
        isPassword: true,
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
        textInputAction: TextInputAction.next,
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

  Widget _phoneNumberTextField(BuildContext context) => AppTextField(
        textFieldType: TextFieldType.PHONE,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: AppStrings.phoneNumberTextFieldLabel.tr(),
          labelStyle: getRegularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textSecondaryColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.lightGrey.withOpacity(0.2),
            ),
          ),
          prefixIcon: GestureDetector(
            onTap: () async => await _countryPicker
                .showPicker(context: context, pickerMaxHeight: 30.h)
                .then((code) => _countryCodeCubit.changeCountryCode(
                      code ?? _countryCodeCubit.countryCode,
                    )),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppPadding.p2.w,
                vertical: AppPadding.p0_5.h,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p1.w,
                vertical: AppPadding.p0_5.h,
              ),
              color: ColorManager.white,
              child: BlocBuilder<CountryCodeCubit, CountryCodeState>(
                builder: (context, state) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _countryCodeCubit.countryCode.flagImage,
                    SizedBox(width: AppSize.s1.w),
                    Text(
                      _countryCodeCubit.countryCode.dialCode,
                      style: getRegularTextStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _addressTextField() => AppTextField(
        textFieldType: TextFieldType.MULTILINE,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: AppStrings.addressTextFieldLabel.tr(),
          labelStyle: getRegularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textSecondaryColor,
          ),
          prefixIcon: const Icon(
            CupertinoIcons.map_pin_ellipse,
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

  Widget _nameTextFields() => Row(
        children: [
          AppTextField(
            textFieldType: TextFieldType.NAME,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: AppStrings.firstNameTextFieldLabel.tr(),
              labelStyle: getRegularTextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.textSecondaryColor,
              ),
              prefixIcon: const Icon(
                Icons.person_outline,
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
          ).expand(),
          SizedBox(width: AppSize.s2.w),
          AppTextField(
            textFieldType: TextFieldType.NAME,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: AppStrings.lastNameTextFieldLabel.tr(),
              labelStyle: getRegularTextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.textSecondaryColor,
              ),
              prefixIcon: const Icon(
                Icons.person_outline,
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
          ).expand(),
        ],
      );

  Widget _genderSelection() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.gender.tr(),
            style: getRegularTextStyle(
              fontSize: FontSize.s16,
              color: ColorManager.textSecondaryColor,
            ),
          ),
          SizedBox(width: AppSize.s5.w),
          DropdownButton<Gender>(
            items: Constants.genders
                .map(
                  (item) => DropdownMenuItem<Gender>(
                    value: item,
                    child: Text(
                      item.getLocalizedString(),
                      style: getRegularTextStyle(
                        fontSize: FontSize.s16,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: gender,
            onChanged: (item) => setState(() {
              gender = item!;
            }),
          ),
        ],
      );

  List<Widget> _registerTitle() => [
        SizedBox(height: AppSize.s3_5.h),
        Text(
          AppStrings.register.tr(),
          style: getBoldTextStyle(
            fontSize: FontSize.s28,
            color: ColorManager.textPrimaryColor,
          ),
        ),
        SizedBox(height: AppSize.s1.h),
        Text(
          AppStrings.registerTitle.tr(),
          style: getRegularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textSecondaryColor,
          ),
        ),
        SizedBox(height: AppSize.s2.h),
      ];
}
