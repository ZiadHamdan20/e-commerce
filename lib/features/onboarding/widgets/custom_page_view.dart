

import 'package:ecommerce_app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_page_view_item.dart';

class CustomPageView extends StatelessWidget {
   const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());

    return PageView (
      controller: controller.pageController,
      onPageChanged: controller.updatePageIndicator,
      children:const [
        CustomPageViewItem(
          title:CustomTexts.onBoarding1,
          subTitle:CustomTexts.onBoardingSubTitle1 ,
          image: CustomImageStrings.onBoarding1,),

        CustomPageViewItem(
            title:CustomTexts.onBoarding2,
            subTitle:CustomTexts.onBoardingSubTitle2 ,
            image: CustomImageStrings.onBoarding2),

        CustomPageViewItem(
            title:CustomTexts.onBoarding3,
            subTitle:CustomTexts.onBoardingSubTitle3 ,
            image: CustomImageStrings.onBoarding3),
      ],
    );
  }
}
