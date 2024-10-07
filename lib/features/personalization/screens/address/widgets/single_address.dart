import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/customShapes/rounded_container.dart';

class CustomSingleAddress extends StatelessWidget {
  const CustomSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);

    return RoundedContainer(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? CustomColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDarkMode
              ? CustomColors.darkerGrey
              : CustomColors.grey,
      margin: EdgeInsets.only(bottom: CustomSizes.spaceBetweenItems.h),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? isDarkMode
                        ? CustomColors.light
                        : CustomColors.dark
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jane Doe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: CustomSizes.sm.h / 2,
              ),
              const Text(
                "(+963) 922 8396",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: CustomSizes.sm.h / 2,
              ),
              const Text(
                "82356 Timmy Coves,South Liana,Maine, 87665, USA",
                softWrap: true,
              ),
              SizedBox(
                height: CustomSizes.sm.h / 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
