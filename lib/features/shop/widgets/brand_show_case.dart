import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/customShapes/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/custom_helpers.dart';
import 'brand_card.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });

  final List<String>images ;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: CustomColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(CustomSizes.sm),
      margin: EdgeInsets.only(bottom: CustomSizes.spaceBetweenItems.h),
      child: Column(
        children: [
          //brand with prod count
          const BrandCard(showBorder: false,),

          //brand top 3 prod images

          Row(
            children: images.map((image)=>brandTopProductImageWidget(image, context)).toList(),
          )
        ],

      ),
    );
  }
}


Widget brandTopProductImageWidget(String image,context)
{
  final isDarkMode=CustomHelpers.isDarkMode(context);

  return Expanded(child: RoundedContainer(
    height: 100.h,
    backgroundColor: isDarkMode?CustomColors.darkGrey:CustomColors.light,
    padding: const EdgeInsets.all(CustomSizes.sm),
    margin: EdgeInsets.only(right: CustomSizes.md.w),
    child:  Image(fit: BoxFit.contain,image: AssetImage(image),),
  ));
}