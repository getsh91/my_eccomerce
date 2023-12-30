import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import '../../constants/sizes.dart';

class ITextFormFieldTheme {
  ITextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: IColors.darkGrey,
    suffixIconColor: IColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: ISizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: ISizes.fontSizeMd, color: IColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ISizes.fontSizeSm, color: IColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: IColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: IColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: IColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: IColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: IColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: IColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: IColors.darkGrey,
    suffixIconColor: IColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: ISizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: ISizes.fontSizeMd, color: IColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: ISizes.fontSizeSm, color: IColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: IColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: IColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: IColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: IColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: IColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ISizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: IColors.warning),
    ),
  );
}
