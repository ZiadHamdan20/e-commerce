import 'package:flutter/material.dart';

import '../../constants/colors.dart';

abstract class CustomOutlinedBtnTheme
{
  static OutlinedButtonThemeData lightOutlinedButtonThemeData=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomColors.black,
      side: const BorderSide(color: CustomColors.primary),
      textStyle: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),

    )
  );


  static OutlinedButtonThemeData darkOutlinedButtonThemeData=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: const BorderSide(color: CustomColors.primary),
      textStyle: const TextStyle(fontSize: 16,color: CustomColors.white,fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),

    )
  );
}