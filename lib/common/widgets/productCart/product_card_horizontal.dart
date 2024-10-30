import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/product_label_text.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_with%20verification_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../icons/circular_icon.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);
    return Container(
      width: 310.w,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.productImageRadius.r),
          color: isDarkMode ? CustomColors.darkerGrey : CustomColors.softGrey),
      child: Row(
        children: [
          //thumbnail
          CustomRoundedContainer(
            height: 120.h,
            padding: const EdgeInsets.all(CustomSizes.sm),
            backgroundColor:
                isDarkMode ? CustomColors.dark : CustomColors.light,
            child: Stack(
              children: [
                //thumbnail image
                SizedBox(
                    height: 120.h,
                    width: 120.w,
                    child: const CustomRoundedImage(
                      imgUrl: CustomImageStrings.productImage1,
                      applyImgRadius: true,
                    )),

                Positioned(
                  top: 12,
                  child: CustomRoundedContainer(
                    radius: CustomSizes.sm,
                    backgroundColor: CustomColors.secondary.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(
                        horizontal: CustomSizes.sm.w,
                        vertical: CustomSizes.xs.h),
                    child: Text(
                      "25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: CustomColors.black),
                    ),
                  ),
                ),

                //fav icon btn
                const Positioned(
                  right: 0,
                  top: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          //details
          SizedBox(
            width: 172.w,
            child: Padding(
              padding:  EdgeInsets.only(top: CustomSizes.sm.h, left: CustomSizes.sm.w),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomProductTitleText(title: 'Green Nike Half sleeves shirt',smallSize: true,),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
                      const CustomBrandTitleTextWithVerifiedIcon(title: "Nike")
                    ],
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //pricing
                      const Flexible(child: ProductPriceText(price: "250.0")),

                      //add to cart button
                      Container(
                        decoration: const BoxDecoration(
                            color: CustomColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft:
                              Radius.circular(CustomSizes.cardRadiusMd),
                              bottomRight: Radius.circular(
                                  CustomSizes.productImageRadius),
                            )),
                        child: SizedBox(
                            width: CustomSizes.iconLg.w * 1.2,
                            height: CustomSizes.iconLg.h * 1.2,
                            child: const Center(
                                child: Icon(
                                  Iconsax.add,
                                  color: CustomColors.white,
                                ))),
                      )


                    ],
                  )


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
