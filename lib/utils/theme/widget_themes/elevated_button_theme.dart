import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class IElevatedButtonTheme {
  IElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: IColors.light,
      backgroundColor: IColors.primary,
      disabledForegroundColor: IColors.darkGrey,
      disabledBackgroundColor: IColors.buttonDisabled,
      side: const BorderSide(color: IColors.primary),
      padding: const EdgeInsets.symmetric(vertical: ISizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: IColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ISizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: IColors.light,
      backgroundColor: IColors.primary,
      disabledForegroundColor: IColors.darkGrey,
      disabledBackgroundColor: IColors.darkerGrey,
      side: const BorderSide(color: IColors.primary),
      padding: const EdgeInsets.symmetric(vertical: ISizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: IColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ISizes.buttonRadius)),
    ),
  );
}
