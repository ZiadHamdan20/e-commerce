import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/device/custom_device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(
              CustomTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: CustomSizes.spaceBetweenItems.h,
            ),
            Text(
              CustomTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: CustomSizes.spaceBetweenSections.h * 2,
            ),

            //Text field
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined), labelText: CustomTexts.email),
            ),
            SizedBox(height: CustomSizes.spaceBetweenSections.h),

            SizedBox(
              width: CustomDeviceUtils.getScreenWidth(context).w ,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(PagesNames.resetPasswordScreen);
                },
                child: const Text(CustomTexts.submit),
              ),
            )

            // submit btn
          ],
        ),
      ),
    );
  }
}
