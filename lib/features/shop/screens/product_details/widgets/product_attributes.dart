import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/product_label_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  Column(
      //Selected attributes pricing & description
      children: [
        RoundedContainer(
          padding: const EdgeInsets.all(CustomSizes.md),
          backgroundColor: isDarkMode?CustomColors.darkerGrey:CustomColors.grey,
          child:Column(
            children: [
              //title,price,stock status
              Row(
                children: [
                  const SectionHeading(headTitle: "Variation",showActionBtn: false,),
                  SizedBox(width: CustomSizes.spaceBetweenItems.w,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          const ProductTitleText(title: "Price : ",smallSize: true,),
                          SizedBox(width: CustomSizes.spaceBetweenItems.w,),

                          //actual price
                          Text("\$25",style: Theme.of(context).textTheme.titleSmall!.copyWith(decoration: TextDecoration.lineThrough),),
                          SizedBox(width: CustomSizes.spaceBetweenItems.w,),

                          //sale price
                          const ProductPriceText(price: "\$20"),
                        ],
                      ),

                      //Stock
                      Row(children: [
                        const ProductTitleText(title: "Stock : ",smallSize: true,),
                        Text("In Stock",style: Theme.of(context).textTheme.titleMedium,)

                      ],)
                    ],
                  )


                ],
              ),
              
              //Variation description
              const ProductTitleText(title: "this is the desc of the product...it can go up to 4 max Lines")

              //variation description
            ],
          ) ,
        ),
        SizedBox(height: CustomSizes.spaceBetweenItems.h,),

        //attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SectionHeading(headTitle: "Colors",showActionBtn: false,),
            SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
        Wrap(
          spacing: 8,
          children: [
            CustomChoiceChip(text: 'Green', selected: true,onSelected: (value){},),
            CustomChoiceChip(text: 'Blue', selected: false,onSelected: (value){},),
            CustomChoiceChip(text: 'Red', selected: false,onSelected: (value){},),


          ],
        )
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(headTitle: "Size",showActionBtn: false,),
            SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),

            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(text: 'EU 34', selected: true,onSelected: (value){},),
                CustomChoiceChip(text: 'EU 36', selected: false,onSelected: (value){},),
                CustomChoiceChip(text: 'EU 38', selected: false,onSelected: (value){},),


              ],
            )
          ],
        ),
      ],


    );
  }
}
