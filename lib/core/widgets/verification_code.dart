import 'package:dr_purple/app/app_management/color_manager.dart';
import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerificationCode extends StatelessWidget {
  final ValueChanged<String> onChange;
  final int length;
  final double itemSize;

  const VerificationCode({
    Key? key,
    required this.onChange,
    required this.length,
    required this.itemSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Pinput(
        length: length,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.digitsOnly
        ],
        pinAnimationType: PinAnimationType.fade,
        defaultPinTheme: PinTheme(
          width: itemSize,
          height: itemSize,
          margin: EdgeInsets.all(AppPadding.p8.sp),
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.black),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s0),
            ),
            color: ColorManager.primary,
          ),
        ),
        focusedPinTheme: PinTheme(
          width: itemSize,
          height: itemSize,
          margin: EdgeInsets.all(AppPadding.p8.sp),
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManager.black),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s0),
            ),
            border: Border.all(
              color: ColorManager.primary,
              width: AppSize.s0_5.w,
            ),
            color: ColorManager.primary,
          ),
        ),
        onChanged: onChange,
      );
}
