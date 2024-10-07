import 'package:ecommerce_app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/custom_device_utils.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/helpers/custom_helpers.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=OnBoardingController.instance;
    final isDark=CustomHelpers.isDarkMode(context);
    return Positioned(
      bottom:CustomDeviceUtils.getBottomNavigationBarHeight()+25,
      left: CustomSizes.defaultSpace,

      child: SmoothPageIndicator(
        
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
        effect: ExpandingDotsEffect(activeDotColor:isDark? CustomColors.dark: CustomColors.light,dotHeight: 6),
      ),
    );
  }
}
