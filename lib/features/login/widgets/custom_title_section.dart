import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import '../../../utils/helpers/custom_helpers.dart';

class CustomTitleSection extends StatelessWidget {
  const CustomTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150.h,
            image: AssetImage(isDarkMode
                ? CustomImageStrings.lightAppLogo
                : CustomImageStrings.darkAppLogo)),
        Text(
          CustomTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: CustomSizes.sm.h,
        ),
        //Title
        Text(
          CustomTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

      ],
    );
  }
}
