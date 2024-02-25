import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:ecommers_app2/core/theme/widget_themes/appbar_theme.dart';
import 'package:ecommers_app2/core/theme/widget_themes/elevated_button_theme.dart';
import 'package:ecommers_app2/core/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: 'Poppins',
    // disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.lightPrimary,
    textTheme: TTextTheme.lightTextTheme,
    // chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.lightBackground,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    //checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    //bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    //outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    //inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    //fontFamily: 'Poppins',
    // disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.darkPrimary,
    textTheme: TTextTheme.darkTextTheme,
    //chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.darkBackground,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    //checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    //bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    //outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    //inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
