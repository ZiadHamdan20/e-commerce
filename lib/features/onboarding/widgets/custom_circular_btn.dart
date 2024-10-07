import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/custom_device_utils.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';

import '../controllers/onboarding_controller.dart';

class CustomCircularBtn extends StatelessWidget {
  const CustomCircularBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return Positioned
      (
      right: CustomSizes.defaultSpace,
        bottom: CustomDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: isDarkMode?CustomColors.primary : CustomColors.black,),
            shape: const CircleBorder(),
            backgroundColor: isDarkMode?CustomColors.primary : CustomColors.black,

          ),
      onPressed: (){
        OnBoardingController.instance.nextPage(context);          },
      child: const Icon(Icons.arrow_forward_ios,),
    )
    );
  }
}
