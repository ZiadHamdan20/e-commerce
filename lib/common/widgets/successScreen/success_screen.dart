import 'package:ecommerce_app/common/style/CustomStyle.dart';

import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/device/custom_device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key,
    required this.title,
    required this.subTitle,
    required this.image,
     required this.onPressed});

  final String title;
  final String subTitle;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CustomStyle.paddingWithAppBarHeight * 2 ,
          child: Column(

            children: [
              Image(image:  AssetImage(
                  image),width: CustomDeviceUtils.getScreenWidth(context).w * 0.6,),

              SizedBox(height: CustomSizes.spaceBetweenSections.h,),


              //title & sub title
              Text(title.capitalize!,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: CustomSizes.spaceBetweenItems.h,),
              Text(subTitle.capitalize!,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              SizedBox(height: CustomSizes.spaceBetweenSections.h,),


              //btns
              SizedBox(
                width: CustomDeviceUtils.getScreenWidth(context).w,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(CustomTexts.continuee),
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}
