import 'package:ecommerce_app/common/widgets/images/circular_Image.dart';
import 'package:ecommerce_app/common/widgets/product_label_text.dart';
import 'package:ecommerce_app/common/widgets/texts/brand_title_with%20verification_icon.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/customShapes/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //sale tag
            CustomRoundedContainer(
              radius: CustomSizes.sm.r,
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

            SizedBox(width: CustomSizes.spaceBetweenItems.w,),
            
            //price
            Text("\$250",style: Theme.of(context).textTheme.titleSmall!.copyWith(decoration: TextDecoration.lineThrough),),

            SizedBox(width: CustomSizes.spaceBetweenItems.w,),

            const ProductPriceText(price: "175",isLarge: true,),


          ],
        ),

        SizedBox(height: CustomSizes.spaceBetweenItems.h/1.5,),

        //title
        const CustomProductTitleText(title: "Green Nike sports shirt"),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/1.5,),

        //stock status
        Row(
          children: [
            const CustomProductTitleText(title: "Status"),
            SizedBox(width: CustomSizes.spaceBetweenItems.w,),

            Text("In Stock",style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h/1.5,),

        //brand
        Row(
          children: [
            CircularImage(image: CustomImageStrings.sportIcon,width: 32.w,height: 32.h,overlayColor: isDarkMode?CustomColors.white:CustomColors.black,),
            const CustomBrandTitleTextWithVerifiedIcon(title: "Nike",brandTextSize:TextSizes.medium,),
          ],
        )


      ],
    );
  }
}
