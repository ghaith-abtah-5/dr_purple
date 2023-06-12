import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:dr_purple/app/app_management/strings_manager.dart';
import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/theme/styles_manager.dart';
import 'package:dr_purple/app/app_management/theme/theme_cubit/theme_cubit.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:dr_purple/app/dependency_injection/dependency_injection.dart';
import 'package:dr_purple/app/dummy_test_data/dummy_test_data.dart';
import 'package:dr_purple/core/widgets/design/dr_purple_appointment_list_item_design.dart';
import 'package:dr_purple/core/widgets/dr_purple_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  List<AppointmentData> data = appointmentDataList();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: DrPurpleScaffold(
          body: Column(
            children: [..._appointmentAppBar(), _appointmentMainView()],
          ),
        ),
      );

  Widget _appointmentMainView() => Container(
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radiusOnly(),
          backgroundColor: instance<ThemeCubit>().isThemeDark
              ? ColorManager.black
              : ColorManager.white,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p2.w),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s2.h),
              Column(
                children: data
                    .map((e) =>
                        DrPurpleAppointmentListItemDesign(appointmentData: e))
                    .toList(),
              ),
            ],
          ),
        ),
      ).expand();

  List<Widget> _appointmentAppBar() => [
        Text(
          AppStrings.appointmentsNav.tr(),
          style: getBoldTextStyle(
            fontSize: FontSize.s20,
            color: ColorManager.white,
          ),
        ).paddingAll(AppPadding.p18.sp),
        SizedBox(width: AppSize.s2.w),
      ];
}
