import 'package:ecommerce_app/features/onboarding/screens/onboardingScreen.dart';
import 'package:ecommerce_app/utils/constants/routes.dart';
import 'package:ecommerce_app/utils/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery
        .of(context)
        .size);
    return ScreenUtilInit(
        designSize: const Size(392.7, 781.1),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,

          home: const OnBoardingScreen(),

          onGenerateRoute: (settings) => onGenerateRoute(settings),
        );}
    );

  }
}