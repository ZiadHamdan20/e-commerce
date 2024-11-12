import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class CustomProductWithAddRemoveButton extends StatelessWidget {
  const CustomProductWithAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });
final int quantity;
final VoidCallback? add,remove;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode=CustomHelpers.isDarkMode(context);

    return
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCircularIcon(
              icon: Iconsax.minus,
              width: 32.w,
              height: 32.h,
              size: CustomSizes.md,
              iconColor: isDarkMode
                  ? CustomColors.white
                  : CustomColors.black,
              backgroundColor: isDarkMode
                  ? CustomColors.darkerGrey
                  : CustomColors.light,

              onPressed: remove,
            ),
            SizedBox(
              width: CustomSizes.spaceBetweenItems.w,
            ),
            Text(
              quantity.toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              width: CustomSizes.spaceBetweenItems.w,
            ),
            CustomCircularIcon(
                icon: Iconsax.add,
                width: 32.w,
                height: 32.h,
                size: CustomSizes.md,
                iconColor: CustomColors.white,
                backgroundColor: CustomColors.primary,
                onPressed: add,),
          ],

        );
  }
}
