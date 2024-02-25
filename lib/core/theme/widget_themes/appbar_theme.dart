import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.lightPrimary,
    surfaceTintColor: TColors.lightPrimary,
    iconTheme:
        IconThemeData(color: TColors.darkBackground, size: TSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: TColors.darkBackground, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.textDark),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.darkPrimary,
    surfaceTintColor: TColors.darkPrimary,
    iconTheme: IconThemeData(color: TColors.lightPrimary, size: TSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: TColors.lightPrimary, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: TSizes.fontSizeLg,
        fontWeight: FontWeight.w600,
        color: TColors.textLight),
  );
}
