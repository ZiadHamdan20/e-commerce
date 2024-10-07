import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class CustomElevatedButtonTheme
{
  static ElevatedButtonThemeData lightElevatedButtonThemeData=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomColors.white,
      backgroundColor: CustomColors.primary,
      disabledForegroundColor: CustomColors.grey,
      disabledBackgroundColor: CustomColors.grey,
      side: const BorderSide(color: CustomColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16,color: CustomColors.white,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      
    )
  );
  static ElevatedButtonThemeData darkElevatedButtonThemeData=ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: CustomColors.white,
          backgroundColor: CustomColors.primary,
          disabledForegroundColor: CustomColors.grey,
          disabledBackgroundColor: CustomColors.grey,
          side: const BorderSide(color: CustomColors.primary),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(fontSize: 16,color: CustomColors.white,fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))

      )
  );
}