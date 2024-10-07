import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class CustomTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32.sp),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 24.sp),
    headlineSmall: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18.sp),

    titleLarge: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16.sp),
    titleMedium: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16.sp),
    titleSmall: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16.sp),

    bodyLarge: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14.sp),
    bodyMedium: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 14.sp),
    bodySmall: TextStyle(fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5), fontSize: 14.sp),

    labelLarge: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 12.sp),
    labelMedium: TextStyle(fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5), fontSize: 12.sp),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 32.sp),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 24.sp),
    headlineSmall: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18.sp),

    titleLarge: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16.sp),
    titleMedium: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 16.sp),
    titleSmall: TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 16.sp),

    bodyLarge: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14.sp),
    bodyMedium: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14.sp),
    bodySmall: TextStyle(fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5), fontSize: 14.sp),

    labelLarge: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 12.sp),
    labelMedium: TextStyle(fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5), fontSize: 12.sp),
  );
}
