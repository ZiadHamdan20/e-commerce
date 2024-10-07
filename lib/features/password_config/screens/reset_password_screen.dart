import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/device/custom_device_utils.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(

          children: [
            Image(image:  const AssetImage(
                CustomImageStrings.deliveredEmailIllus),width: CustomDeviceUtils.getScreenWidth(context).w * 0.6,),

            SizedBox(height: CustomSizes.spaceBetweenSections.h,),


            //title & sub title
            Text(CustomTexts.changeYourPasswordTitle.capitalize!,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: CustomSizes.spaceBetweenItems.h,),
            Text(CustomTexts.changeYourPasswordSubTitle.capitalize!,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            SizedBox(height: CustomSizes.spaceBetweenSections.h,),


            //btns
            SizedBox(
              width: CustomDeviceUtils.getScreenWidth(context).w,
              child: ElevatedButton(
                onPressed: (){},
                child: const Text(CustomTexts.done),
              ),
            ),

            SizedBox(height: CustomSizes.spaceBetweenItems.h,),
            SizedBox(
              width: CustomDeviceUtils.getScreenWidth(context).w,
              child: TextButton(
                onPressed: (){},
                child: const Text(CustomTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
