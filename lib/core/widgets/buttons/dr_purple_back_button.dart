import 'package:dr_purple/app/app_management/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DrPurpleBackButton extends StatelessWidget {
  const DrPurpleBackButton({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Icon(Icons.arrow_back_ios, color: color, size: AppSize.s22),
      ).paddingOnly(top: 24.0, left: 24.0).onTap(() => context.pop());
}
