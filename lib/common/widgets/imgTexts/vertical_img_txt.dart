import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/custom_helpers.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor= CustomColors.white,
    this.backgroundColor ,
    this.onTap,
  });

  final String image, title;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: CustomSizes.spaceBetweenItems.w),
        child: Column(
          children: [
            //circular icon
            Container(
              width: 56.w,
              height: 56.h,
              padding: const EdgeInsets.all(CustomSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ?? (isDarkMode ? CustomColors.black:CustomColors.white),
                  borderRadius: BorderRadius.circular(100.r)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: isDarkMode ? CustomColors.light:CustomColors.dark,
                ),
              ),
            ),
            SizedBox(
              height: CustomSizes.spaceBetweenItems.h / 2,
            ),

            //title
            SizedBox(
                width: 55.w,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: textColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ))
          ],
        ),
      ),
    );
  }
}