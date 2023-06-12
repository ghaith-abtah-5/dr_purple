import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/theme/styles_manager.dart';
import 'package:dr_purple/app/app_management/theme/theme_cubit/theme_cubit.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentDetailsList extends StatelessWidget {
  const AppointmentDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            ImageAssets.hospitalImage,
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(AppSize.s8),
          SizedBox(height: AppSize.s2.h),
          Text(
            "Dr. Purple",
            style: getBoldTextStyle(
              color: ColorManager.textPrimaryColor,
              fontSize: FontSize.s16,
            ),
          ),
          SizedBox(height: AppSize.s2.h),
          const Divider(thickness: AppSize.s0_5),
          SizedBox(height: AppSize.s2.h),
          _mOption('Location'),
          SizedBox(height: AppSize.s1.h),
          Text(
            "Damascus, Syria",
            style: getRegularTextStyle(
              color: ColorManager.primary,
              fontSize: FontSize.s14,
            ),
          ).paddingLeft(AppPadding.p5.w),
          SizedBox(height: AppSize.s2.h),
          _mOption('Service'),
          SizedBox(height: AppSize.s1.h),
          Text(
            'Cosmetology - SP 150000',
            style: getRegularTextStyle(
              color: ColorManager.primary,
              fontSize: FontSize.s14,
            ),
          ).paddingLeft(AppPadding.p5.w),
          SizedBox(height: AppSize.s2.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: AppPadding.p0_5.h),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: ColorManager.cyan,
                  borderRadius: radius(AppSize.s12),
                ),
                child: Image.asset(
                  ImageAssets.doctorImage,
                  height: AppSize.s50,
                  width: AppSize.s50,
                ),
              ),
              SizedBox(width: AppSize.s2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doctor',
                    style: getRegularTextStyle(
                      color: instance<ThemeCubit>().isThemeDark
                          ? ColorManager.white
                          : ColorManager.black,
                    ),
                  ),
                  SizedBox(height: AppSize.s1.h),
                  Text(
                    'Dr. Sedra Sedra',
                    style: getRegularTextStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppSize.s2.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: AppPadding.p0_5.h),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radius(AppSize.s12),
                  backgroundColor: ColorManager.cyan,
                ),
                child: Image.asset(
                  ImageAssets.femaleProfileImage,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(width: AppSize.s2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Patient',
                    style: getRegularTextStyle(
                      color: instance<ThemeCubit>().isThemeDark
                          ? ColorManager.white
                          : ColorManager.black,
                    ),
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Text(
                    'Sedra Sedra',
                    style: getRegularTextStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppSize.s2.h),
          _mOption('Service'),
          SizedBox(height: AppSize.s0_5.h),
          Text(
            'Thu, Mar 18 - 08:00 AM',
            style: getRegularTextStyle(
              color: ColorManager.primary,
              fontSize: FontSize.s14,
            ),
          ).paddingLeft(AppPadding.p5.w),
          SizedBox(height: AppSize.s2.h),
          _mOption('Payment Method'),
          SizedBox(height: AppSize.s1.h),
          Text(
            'Payment at the clinic',
            style: getRegularTextStyle(
              color: ColorManager.primary,
              fontSize: FontSize.s14,
            ),
          ).paddingLeft(AppPadding.p5.w),
        ],
      ).paddingAll(AppPadding.p18.sp),
    );
  }

  Widget _mOption(var value) => RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: const Icon(Icons.location_searching, size: AppSize.s12)
                  .paddingRight(AppPadding.p2.w),
            ),
            TextSpan(
              text: value,
              style: getRegularTextStyle(
                fontSize: FontSize.s12,
                color: ColorManager.textSecondaryColor,
              ),
            ),
          ],
        ),
      );
}
