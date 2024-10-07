import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/theme/custom%20theme/custom_Text_form_field_theme.dart';
import 'package:ecommerce_app/utils/theme/custom%20theme/custom_app_bar_theme.dart';
import 'package:ecommerce_app/utils/theme/custom%20theme/custom_bottom_sheet_theme.dart';
import 'package:ecommerce_app/utils/theme/custom%20theme/custom_checkbox_theme.dart';
import 'package:ecommerce_app/utils/theme/custom%20theme/custom_chip_theme.dart';
import 'package:ecommerce_app/utils/theme/custom%20theme/custom_elevated_btn_theme.dart';
import 'package:ecommerce_app/utils/theme/custom%20theme/custom_outlined_btn_theme.dart';
import 'package:ecommerce_app/utils/theme/custom%20theme/custom_text_theme.dart';
import 'package:flutter/material.dart';


abstract class AppTheme {

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      primaryColor: CustomColors.primary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: CustomColors.white,
      textTheme: CustomTextTheme.lightTextTheme,
      elevatedButtonTheme:
          CustomElevatedButtonTheme.lightElevatedButtonThemeData,
      appBarTheme: CustomAppBarTheme.lightAppbarTheme,
      bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
      checkboxTheme: CustomCheckboxTheme.lightCheckboxThemeData,
      chipTheme: CustomChipTheme.lightChipTheme,
      inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: CustomOutlinedBtnTheme.lightOutlinedButtonThemeData);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      primaryColor: CustomColors.primary,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: CustomColors.dark,
      textTheme: CustomTextTheme.darkTextTheme,
      elevatedButtonTheme:
          CustomElevatedButtonTheme.darkElevatedButtonThemeData,
      appBarTheme: CustomAppBarTheme.darkAppbarTheme,
      bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: CustomCheckboxTheme.darkCheckboxThemeData,
      chipTheme: CustomChipTheme.darkChipTheme,
      inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
      outlinedButtonTheme: CustomOutlinedBtnTheme.darkOutlinedButtonThemeData);
}
