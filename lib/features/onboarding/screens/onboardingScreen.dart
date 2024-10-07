import 'package:ecommerce_app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_app/features/onboarding/widgets/Custom_skip_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_circular_btn.dart';
import '../widgets/custom_page_view.dart';
import '../widgets/custom_smooth_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController=Get.put(OnBoardingController());
    return const Scaffold(
      body: Stack(
        children: [
          CustomPageView(),
          CustomSkipBtn(),
          CustomSmoothIndicator(),
          CustomCircularBtn()

        ],
      )
    );
  }
}
