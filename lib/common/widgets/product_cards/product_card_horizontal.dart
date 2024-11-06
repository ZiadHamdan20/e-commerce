import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/common/widgets/product_label_text.dart';
import 'package:ecommerce_app/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_with%20verification_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/controllers/product/product_controller.dart';
import '../../../utils/constants/enums.dart';


class CustomProductCardHorizontal extends StatelessWidget {
  const CustomProductCardHorizontal({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);

    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);

    return Container(
      width: 310.w,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.productImageRadius.r),
          color: isDarkMode ? CustomColors.darkerGrey : CustomColors.softGrey),
      child: Row(
        children: [
          /// Thumbnail
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
                    child:  CustomRoundedImage(
                      imgUrl: product.thumbnail,
                      applyImgRadius: true,
                      isNetworkImage: true,
                    )),

                /// -- Sale Percentage
                if(salePercentage != null)
                  Positioned(
                    top: 12,
                    child: CustomRoundedContainer(
                      radius: CustomSizes.sm,
                      backgroundColor: CustomColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                          horizontal: CustomSizes.sm.w,
                          vertical: CustomSizes.xs.h),
                      child: Text(
                        "$salePercentage%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: CustomColors.black),
                      ),
                    ),
                  ),



                /// -- Fav icon button
                  Positioned(
                  right: 0,
                  top: 0,
                  child: CustomFavouriteIcon(productId: product.id)
                ),
              ],
            ),
          ),

          /// -- Details
          SizedBox(
            width: 172.w,
            child: Padding(
              padding:  EdgeInsets.only(top: CustomSizes.sm.h, left: CustomSizes.sm.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomProductTitleText(title: product.title,smallSize: true,),
                      SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
                       CustomBrandTitleTextWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),

                  const Spacer(),
                  /// Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ///Price
                      Flexible(
                        child: Column(
                          children: [
                            if(product.productType==ProductType.single.toString() && product.salePrice > 0)
                              Padding(
                                padding: EdgeInsets.only(left: CustomSizes.sm.w),
                                child:  Text(
                                  product.price.toString(),style: Theme.of(context).textTheme.labelMedium!.copyWith(decoration: TextDecoration.lineThrough),
                                ),
                              ),

                            ///price,show sale price as main price if sale exist
                            Padding(
                              padding: EdgeInsets.only(left: CustomSizes.sm.w),
                              child:  ProductPriceText(
                                price: controller.getProductPrice(product),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// -- Add To Cart Button
                      Container(
                        decoration: const BoxDecoration(
                            color: CustomColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(CustomSizes.cardRadiusMd),
                              bottomRight: Radius.circular(CustomSizes.productImageRadius),
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
