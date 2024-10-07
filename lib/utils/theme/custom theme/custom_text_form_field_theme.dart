import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

abstract class CustomTextFormFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    // constraints: BoxConstraints.expand(height: 14,inputFileHeight),
    labelStyle: const TextStyle().copyWith(fontSize: CustomSizes.fontSizeMd, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: CustomSizes.fontSizeSm, color: Colors.black),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: Colors.grey)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: Colors.grey)),

    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: CustomColors.dark)),

    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: CustomColors.warning)),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CustomColors.warning)),

  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(


    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,



    // constraints: BoxConstraints.expand(height: 14,inputFileHeight),
    labelStyle: const TextStyle().copyWith(fontSize: CustomSizes.fontSizeMd, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: CustomSizes.fontSizeSm, color: Colors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: Colors.grey)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius:BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: CustomColors.darkGrey)),

    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: CustomColors.darkGrey)),

    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color:  CustomColors.warning)),

    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 2, color:  CustomColors.white)),

  );
}
