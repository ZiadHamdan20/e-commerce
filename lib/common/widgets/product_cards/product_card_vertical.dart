import 'package:ecommerce_app/common/widgets/images/rounded_image.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/custom_helpers.dart';
import '../../style/shadow_style.dart';
import '../customShapes/rounded_container.dart';
import '../product_label_text.dart';
import '../products/favourite_icon/favourite_icon.dart';
import '../texts/brand_title_with verification_icon.dart';
import '../texts/product_price_text.dart';

class CustomProductCardVertical extends StatelessWidget {
  const CustomProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = CustomHelpers.isDarkMode(context);
    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);



    ///Container with side padding , color, edges, radius, and shadow
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(PagesNames.productDetails,arguments: [product]);
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ///Thumbnail,WishList Button, Discount Tag
            CustomRoundedContainer(
              height: 180.h,
              width: 180.w,
              padding: const EdgeInsets.all(CustomSizes.sm),
              backgroundColor:
                  isDarkMode ? CustomColors.dark : CustomColors.light,
              child: Stack(
                children: [
                  ///-- Thumbnail Image
                   Center(
                    child: CustomRoundedImage(
                      imgUrl: product.thumbnail,
                      applyImgRadius: true,
                      isNetworkImage: true,
                    ),
                  ),

                  /// -- Sale Tag
                  if(salePercentage != null)
                  Positioned(
                    top: 12,
                    left: 4,
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

                  /// --favourite Icon Button
                   Positioned(
                    right: 0,
                    top: 0,
                    child: CustomFavouriteIcon(productId: product.id,),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: CustomSizes.spaceBetweenItems / 2.h,
            ),

            /// -- Details
            Padding(
              padding:  EdgeInsets.only(left: CustomSizes.xs.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   CustomProductTitleText(
                    title: product.title,
                    //smallSize: true,
                  ),
                  SizedBox(
                    height: CustomSizes.spaceBetweenItems / 2.h,
                  ),
                   CustomBrandTitleTextWithVerifiedIcon(title: product.brand!.name,),
                ],
              ),
            ),

            //use spacer() to utilize all the space to set the price and the cart button at the bottom.
            //this usually happens when Product title is singe line or 2 lines (Max)
            const Spacer(),

            /// -- Price Row
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
    );
  }
}

