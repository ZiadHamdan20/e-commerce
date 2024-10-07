import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/custom_helpers.dart';
import '../../style/shadow_style.dart';
import '../customShapes/rounded_container.dart';
import '../icons/circular_icon.dart';
import '../product_label_text.dart';
import '../texts/brand_title_with verification_icon.dart';
import '../texts/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(PagesNames.productDetails);
      },
      child: Container(
        width: 180.w,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(CustomSizes.productImageRadius),
            color: isDarkMode ? CustomColors.darkerGrey : CustomColors.white
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180.h,
              padding: const EdgeInsets.all(CustomSizes.sm),
              backgroundColor:
                  isDarkMode ? CustomColors.dark : CustomColors.light,
              child: Stack(
                children: [
                  //thumbnail image
                  const Center(
                    child: RoundedImage(
                      imgUrl: CustomImageStrings.productImage1,
                      applyImgRadius: true,
                    ),
                  ),

                  //sale tag
                  Positioned(
                    top: 12,
                    left: 4,
                    child: RoundedContainer(
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

            SizedBox(
              height: CustomSizes.spaceBetweenItems / 2.h,
            ),
            //Details
            Padding(
              padding: const EdgeInsets.only(left: CustomSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: CustomSizes.spaceBetweenItems / 2.h,
                  ),
                  const BrandTitleTextWithVerifiedIcon(title: 'Nike',),

                  //price row

                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: CustomSizes.sm.w),
                  child: const ProductPriceText(
                    price: "35.5",
                  ),
                ),

                //add to cart btn
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
    );
  }
}

