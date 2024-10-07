import 'package:ecommerce_app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/custom_device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSkipBtn extends StatelessWidget {
  const CustomSkipBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: CustomDeviceUtils.getAppBarHeight(),
        right: CustomSizes.defaultSpace,
        child: TextButton(
      onPressed: (){
        OnBoardingController.instance.skipPage();
      },
      child: Text("Skip",style: TextStyle(fontSize: 16.sp),),

    ));
  }
}
