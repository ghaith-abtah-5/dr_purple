import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_configurations/scroll_behavior.dart';
import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/theme/styles_manager.dart';
import 'package:dr_purple/app/app_management/theme/theme_cubit/theme_cubit.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
import 'package:dr_purple/core/utils/constants.dart';
import 'package:dr_purple/core/utils/enums.dart';
import 'package:dr_purple/core/utils/extensions.dart';
import 'package:dr_purple/core/widgets/buttons/dr_purple_app_button.dart';
import 'package:dr_purple/core/widgets/country_code_picker/src/fl_country_code_picker.dart';
import 'package:dr_purple/core/widgets/dr_purple_drop_down_menu.dart';
import 'package:dr_purple/core/widgets/text_fields/dr_purple_email_text_field.dart';
import 'package:dr_purple/core/widgets/text_fields/dr_purple_first_last_name_text_fields.dart';
import 'package:dr_purple/core/widgets/text_fields/dr_purple_password_text_field.dart';
import 'package:dr_purple/core/widgets/text_fields/dr_purple_phone_number_text_field.dart';
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
  late final TextEditingController _emailTextEditingController,
      _passwordTextEditingController,
      _phoneNumberTextEditingController,
      _firstNameTextEditingController,
      _lastNameTextEditingController;

  final _formKey = GlobalKey<FormState>();

  _bind() {
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _phoneNumberTextEditingController = TextEditingController();
    _firstNameTextEditingController = TextEditingController();
    _lastNameTextEditingController = TextEditingController();

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

  _disposeControllers() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _phoneNumberTextEditingController.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
  }

  _disposeCubit() async => await _countryCodeCubit.close();

  @override
  void dispose() {
    _disposeCubit();
    _disposeControllers();
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

  Widget _registerMainView() => Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._registerTitle(),
            _emailTextField(),
            SizedBox(height: AppSize.s2.h),
            _phoneNumberTextField(),
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
        ).paddingSymmetric(horizontal: AppSize.s4.w),
      );

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
          ).onTap(() => context.pushReplacement("/${Routes.loginRoute}")),
        ],
      );

  Widget _registerButton() => DrPurpleAppButton(
        title: AppStrings.register.tr(),
        onPress: () => context.push(
            "${GoRouter.of(context).location}/${Routes.verifyAccountRoute}"),
      );

  Widget _passwordTextField() => DrPurplePasswordTextField(
        passwordTextEditingController: _passwordTextEditingController,
        formKey: _formKey,
      );

  Widget _emailTextField() => DrPurpleEmailTextField(
        emailTextEditingController: _emailTextEditingController,
        formKey: _formKey,
      );

  Widget _phoneNumberTextField() => DrPurplePhoneNumberTextField(
        phoneNumberTextEditingController: _phoneNumberTextEditingController,
        formKey: _formKey,
        countryCodeCubit: _countryCodeCubit,
        countryPicker: _countryPicker,
      );

  Widget _addressTextField() => AppTextField(
        textFieldType: TextFieldType.MULTILINE,
        textInputAction: TextInputAction.done,
        isValidationRequired: false,
        decoration: InputDecoration(
          labelText: AppStrings.addressTextFieldLabel.tr(),
          labelStyle: getRegularTextStyle(
            fontSize: FontSize.s16,
            color: ColorManager.textSecondaryColor,
          ),
          prefixIcon: Icon(
            CupertinoIcons.map_pin_ellipse,
            color: instance<ThemeCubit>().isThemeDark
                ? ColorManager.white
                : ColorManager.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.lightGrey.withOpacity(0.2),
              width: AppSize.s1,
            ),
          ),
        ),
      );

  Widget _nameTextFields() => DrPurpleFirstLastNameTextFields(
        firstNameTextEditingController: _firstNameTextEditingController,
        lastNameTextEditingController: _lastNameTextEditingController,
        formKey: _formKey,
      );

  Widget _genderSelection() => DrPurpleDropDownMenu<Gender>(
        title: AppStrings.gender.tr(),
        items: Constants.genders
            .map(
              (item) => DropdownMenuItem<Gender>(
                value: item,
                child: Text(
                  item.getLocalizedString(),
                  style: getRegularTextStyle(
                    fontSize: FontSize.s16,
                    color: instance<ThemeCubit>().isThemeDark
                        ? ColorManager.white
                        : ColorManager.primary,
                  ),
                ),
              ),
            )
            .toList(),
        value: gender,
        onChanged: (item) => setState(() {
          gender = item!;
        }),
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
