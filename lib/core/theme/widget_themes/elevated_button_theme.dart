import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: TColors.accent,
      textStyle: const TextStyle(
          fontSize: 16, color: TColors.textLight, fontWeight: FontWeight.w600),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: TColors.accent,
      textStyle: const TextStyle(
          fontSize: 16, color: TColors.textLight, fontWeight: FontWeight.w600),
    ),
  );
}
