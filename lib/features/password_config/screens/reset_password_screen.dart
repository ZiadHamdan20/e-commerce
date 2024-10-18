import 'package:ecommerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/constants/pages_names.dart';
import '../../../utils/device/custom_device_utils.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;
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


            //email & title & sub title
            Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
            SizedBox(height: CustomSizes.spaceBetweenItems.h,),
            Text(CustomTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: CustomSizes.spaceBetweenItems.h,),
            Text(CustomTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            SizedBox(height: CustomSizes.spaceBetweenSections.h,),


            //buttons
            SizedBox(
              width: CustomDeviceUtils.getScreenWidth(context).w,
              child: ElevatedButton(
                onPressed: ()=>Get.offAllNamed(PagesNames.logInScreen),
                child: const Text(CustomTexts.done),
              ),
            ),

            SizedBox(height: CustomSizes.spaceBetweenItems.h,),
            SizedBox(
              width: CustomDeviceUtils.getScreenWidth(context).w,
              child: TextButton(
                onPressed: ()=>ForgetPasswordController.instance.resendPasswordResetEmail(email),
                child: const Text(CustomTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
