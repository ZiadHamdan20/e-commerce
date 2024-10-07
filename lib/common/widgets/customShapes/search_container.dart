import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/device/custom_device_utils.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.showBackground = true,
    this.showBorder = true,
    this.icon = Iconsax.search_normal,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace),
  });
  final String text;
  final bool showBackground, showBorder;
  final IconData? icon;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: CustomDeviceUtils.getScreenWidth(context).w,
          padding: const EdgeInsets.all(CustomSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? isDarkMode
                      ? CustomColors.dark
                      : CustomColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg.r),
              border: showBorder ? Border.all(color: CustomColors.grey) : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: isDarkMode ? CustomColors.darkerGrey : Colors.grey,
              ),
              SizedBox(
                width: CustomSizes.spaceBetweenItems.w,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
