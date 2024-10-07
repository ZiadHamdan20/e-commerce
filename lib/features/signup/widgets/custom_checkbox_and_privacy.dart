import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/texts.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/sizes.dart';

class CustomCheckboxAndPrivacy extends StatelessWidget {
  const CustomCheckboxAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            onChanged: (value) {},
            value: true,
          ),
        ),
        const SizedBox(
          height: CustomSizes.spaceBetweenItems,
        ),
        Text.rich(TextSpan(
          children: [
            TextSpan(
                text: "${CustomTexts.iAgreeTo} ",
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: "${CustomTexts.privacyPolicy} ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: isDarkMode
                        ? CustomColors.white
                        : CustomColors.primary)),
            TextSpan(
                text: "${CustomTexts.and} ",
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: "${CustomTexts.termsOfUse} ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: isDarkMode
                        ? CustomColors.white
                        : CustomColors.primary)),
          ],
        ))
      ],
    );
  }
}
