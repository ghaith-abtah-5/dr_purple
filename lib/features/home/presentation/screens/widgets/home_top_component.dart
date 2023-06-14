import 'package:dr_purple/app/app_configurations/assets.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/route_manager.dart';
import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/theme/styles_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/features/home/presentation/blocs/services_bloc/services_bloc.dart';
import 'package:dr_purple/features/home/presentation/screens/widgets/booked_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeTopComponent extends StatelessWidget {
  const HomeTopComponent({super.key, required this.servicesBloc});

  final ServicesBloc servicesBloc;

  @override
  Widget build(BuildContext context) => Container(
        height: AppSize.s25.h,
        width: context.width(),
        margin: EdgeInsets.only(bottom: AppPadding.p1.h),
        decoration: boxDecorationWithRoundedCorners(
          backgroundColor: ColorManager.primary,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              MediaQuery.of(context).size.width,
              AppSize.s80,
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: AppSize.s2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: AppSize.s22,
                      backgroundColor: ColorManager.cyan,
                      child: Image.asset(ImageAssets.femaleProfileImage),
                    ),
                    SizedBox(width: AppSize.s2.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.hiName.tr(args: ["Sedra"]),
                          style: getBoldTextStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s16,
                          ),
                        ),
                        SizedBox(height: AppSize.s0_5.h),
                        Text(
                          AppStrings.welcome.tr(),
                          style: getRegularTextStyle(
                            color: ColorManager.white.withOpacity(0.7),
                            fontSize: FontSize.s14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.search, color: white, size: AppSize.s24),
                    SizedBox(width: AppSize.s3.w),
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: AppPadding.p4.w),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppPadding.p4.w),
              transform: Matrix4.translationValues(
                  AppSize.s0, AppSize.s16, AppSize.s0),
              alignment: Alignment.center,
              decoration: boxDecorationRoundedWithShadow(12,
                  backgroundColor: context.cardColor),
              child: Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                spacing: AppSize.s1.h,
                children: [
                  _homeTopItem(
                    context,
                    ImageAssets.bookAppointmentImage,
                    AppStrings.appointment.tr(),
                    () => context.push(
                      "${GoRouter.of(context).location}/${Routes.bookAppointmentRoute}",
                      extra: servicesBloc,
                    ),
                  ),
                  _homeTopItem(
                    context,
                    ImageAssets.pharmacyImage,
                    AppStrings.pharmacy.tr(),
                    () => _showDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _homeTopItem(
    BuildContext context,
    String image,
    String title,
    Function() onPress,
  ) =>
      Container(
        constraints: BoxConstraints(minWidth: context.width() * 0.25),
        padding: EdgeInsets.symmetric(vertical: AppPadding.p2.h),
        child: Column(
          children: [
            Image.asset(
              image,
              width: AppSize.s40,
              height: AppSize.s40,
              fit: BoxFit.fill,
            ),
            SizedBox(height: AppSize.s1.h),
            Text(
              title,
              style: getBoldTextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.textPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ).onTap(onPress);

  Future<void> _showDialog(BuildContext context) async => showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return BookedDialog(
            title: "ghaith",
            date: "2023-06-16",
            time: "12:15:11",
          );
        },
      );
}
