import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/device/custom_device_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(PagesNames.logInScreen);
              },
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              //Img
              Image(
                image: const AssetImage(CustomImageStrings.deliveredEmailIllus),
                width: CustomDeviceUtils.getScreenWidth(context).w * 0.6,
              ),

              SizedBox(
                height: CustomSizes.spaceBetweenSections.h,
              ),

              //title & sub title
              Text(
                CustomTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: CustomSizes.spaceBetweenItems.h,
              ),
              Text(
                "ziad.support@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                CustomTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: CustomSizes.spaceBetweenSections.h,
              ),

              //Buttons
              SizedBox(
                width: CustomDeviceUtils.getScreenWidth(context).w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(PagesNames.successScreen, arguments: [
                      CustomTexts.yourAccountCreatedTitle,
                      CustomTexts.yourAccountCreatedSubTitle,
                      CustomImageStrings.staticSuccessIllus,
                      () {
                        Navigator.of(context).pushNamed(PagesNames.logInScreen);
                      }
                    ]);
                  },
                  child: const Text(CustomTexts.continuee),
                ),
              ),
              SizedBox(
                height: CustomSizes.spaceBetweenItems.h,
              ),
              SizedBox(
                width: CustomDeviceUtils.getScreenWidth(context).w,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(CustomTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
