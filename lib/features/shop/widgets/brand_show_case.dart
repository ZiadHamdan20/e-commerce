import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/common/widgets/shimmers/shimmer.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/widgets/customShapes/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/custom_helpers.dart';
import 'brand_card.dart';

class CustomBrandShowcase extends StatelessWidget {
  const CustomBrandShowcase({
    super.key,
    required this.images, required this.brand,
  });

  final BrandModel brand;
  final List<String>images ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.toNamed(PagesNames.brandProducts,arguments: [brand]),
      child: CustomRoundedContainer(
        showBorder: true,
        borderColor: CustomColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(CustomSizes.sm),
        margin: EdgeInsets.only(bottom: CustomSizes.spaceBetweenItems.h),
        child: Column(
          children: [
            /// Brand with prod count
             CustomBrandCard(showBorder: false,brand: brand,),

            /// Brand top 3 prod images

            Row(
              children: images.map((image)=>brandTopProductImageWidget(image, context)).toList(),
            )
          ],

        ),
      ),
    );
  }
}


Widget brandTopProductImageWidget(String image,context)
{
  final isDarkMode=CustomHelpers.isDarkMode(context);

  return Expanded(child: CustomRoundedContainer(
    height: 100.h,
    backgroundColor: isDarkMode?CustomColors.darkGrey:CustomColors.light,
    padding: const EdgeInsets.all(CustomSizes.sm),
    margin: EdgeInsets.only(right: CustomSizes.md.w),
    child:  CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: image,
      progressIndicatorBuilder: (context , url, downloadProgress)=>CustomShimmerEffect(width: 100.w, height: 100.h),
      errorWidget: (context,url,error)=>const Icon(Icons.error),
    ),
  ));
}