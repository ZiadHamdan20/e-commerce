
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/custom_device_utils.dart';

class CustomPageViewItem extends StatelessWidget {
  const CustomPageViewItem({super.key, this.title, this.subTitle, this.image});

  final String? title;
  final String? subTitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      child: Column(
        children: [
          SizedBox(
              width: CustomDeviceUtils.getScreenWidth(context) *0.8,
              height: CustomDeviceUtils.getScreenHeight(context) *0.6,
              child: Image.asset(image!)),

          Text(
            title!,
            style:Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,),

          const SizedBox(height: CustomSizes.spaceBetweenItems,),

          Text(
            subTitle!,
            style:Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.center,),

      ],
      ),
    );
  }
}
