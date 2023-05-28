import 'package:dr_purple/app/app_management/theme/color_manager.dart';
import 'package:dr_purple/app/app_management/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class AppThemeData {
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    primaryColor: ColorManager.appColorPrimary,
    primaryColorDark: ColorManager.appColorPrimary,
    hoverColor: Colors.white54,
    dividerColor: viewLineColor,
    fontFamily: FontConstants.fontFamily,
    appBarTheme: AppBarTheme(
      color: ColorManager.white,
      iconTheme: IconThemeData(color: ColorManager.textPrimaryColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: scaffoldLightColor,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: const ColorScheme.light(
      primary: ColorManager.appColorPrimary,
      error: ColorManager.red,
    ),
    cardTheme: const CardTheme(color: Colors.white),
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: ColorManager.appColorPrimary),
      titleLarge: TextStyle(color: textPrimaryColor),
      titleSmall: TextStyle(color: textSecondaryColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.appBackgroundColorDark,
    highlightColor: ColorManager.appBackgroundColorDark,
    appBarTheme: const AppBarTheme(
      color: ColorManager.appBackgroundColorDark,
      iconTheme: IconThemeData(color: blackColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    primaryColor: ColorManager.colorPrimaryBlack,
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: ColorManager.colorPrimaryBlack,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ColorManager.white),
    hoverColor: Colors.black12,
    fontFamily: FontConstants.fontFamily,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorManager.appBackgroundColorDark),
    primaryTextTheme: TextTheme(
        titleLarge: primaryTextStyle(color: Colors.white),
        labelSmall: primaryTextStyle(color: Colors.white)),
    cardTheme: const CardTheme(color: ColorManager.cardBackgroundBlackDark),
    cardColor: ColorManager.appSecondaryBackgroundColor,
    iconTheme: const IconThemeData(color: whiteColor),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: ColorManager.colorPrimaryBlack),
      titleLarge: TextStyle(color: ColorManager.white),
      titleSmall: TextStyle(color: Colors.white54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark(
            primary: ColorManager.appBackgroundColorDark,
            onPrimary: ColorManager.cardBackgroundBlackDark,
            primaryContainer: ColorManager.colorPrimaryBlack,
            error: Color(0xFFCF6676))
        .copyWith(secondary: ColorManager.white),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
  );
}
