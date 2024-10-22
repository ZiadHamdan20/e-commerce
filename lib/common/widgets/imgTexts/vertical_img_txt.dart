import 'package:ecommerce_app/common/widgets/images/circular_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/custom_helpers.dart';

class CustomVerticalImageText extends StatelessWidget {
  const CustomVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor= CustomColors.white,
    this.backgroundColor ,
    this.onTap,  this.isNetworkImage=true,
  });

  final String image, title;
  final Color? textColor;
  final bool isNetworkImage;
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
            CircularImage(image: image,
              fit: BoxFit.fitWidth,
              padding: CustomSizes.sm*1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: isDarkMode?CustomColors.light:CustomColors.dark,),

            SizedBox(
              height: CustomSizes.spaceBetweenItems.h / 2,
            ),

            //title
            SizedBox(
                width: 55.w,
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: textColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}