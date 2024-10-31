import 'package:ecommerce_app/common/widgets/images/circular_Image.dart';
import 'package:ecommerce_app/common/widgets/product_label_text.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_with%20verification_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/customShapes/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class CustomProductMetaData extends StatelessWidget {
  const CustomProductMetaData({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            /// sale tag
            CustomRoundedContainer(
              radius: CustomSizes.sm.r,
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

            SizedBox(width: CustomSizes.spaceBetweenItems.w,),
            
            /// Price
            if(product.productType==ProductType.single.toString() && product.salePrice>0)
            Text("\$${product.price}",style: Theme.of(context).textTheme.titleSmall!.copyWith(decoration: TextDecoration.lineThrough),),

            if(product.productType==ProductType.single.toString() && product.salePrice>0)
              SizedBox(width: CustomSizes.spaceBetweenItems.w,),

             ProductPriceText(price:controller.getProductPrice(product) ,isLarge: true,),
          ],
        ),

        SizedBox(height: CustomSizes.spaceBetweenItems.h/1.5,),

        /// Title
         CustomProductTitleText(title: product.title),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/1.5,),

        /// Stock Status
        Row(
          children: [
             const CustomProductTitleText(title:"Stock"),
            SizedBox(width: CustomSizes.spaceBetweenItems.w,),

            Text( controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/1.5,),

        //brand
        Row(
          children: [
            CircularImage(isNetworkImage: true,image: product.brand!=null ? product.brand!.image : "",width: 32.w,height: 32.h,overlayColor: isDarkMode?CustomColors.white:CustomColors.black,),
             CustomBrandTitleTextWithVerifiedIcon(title: product.brand!=null ? product.brand!.name : "",brandTextSize:TextSizes.medium,),
          ],
        )


      ],
    );
  }
}
