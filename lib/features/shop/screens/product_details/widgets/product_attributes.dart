import 'package:ecommerce_app/common/widgets/customShapes/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/product_label_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class CustomProductAttributes extends StatelessWidget {
  const CustomProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(VariationController());
    final isDarkMode=CustomHelpers.isDarkMode(context);
    return  Obx(()=>
       Column(
        children: [
          ///-- Selected Attributes Pricing & Description
          // Display variation price and stock where some variation is Selected
          if(controller.selectedVariation.value.id.isNotEmpty)
          CustomRoundedContainer(
            padding: const EdgeInsets.all(CustomSizes.md),
            backgroundColor: isDarkMode?CustomColors.darkerGrey:CustomColors.grey,
            child:Column(
              children: [
                //title,price,stock status
                Row(
                  children: [
                    const CustomSectionHeading(headTitle: "Variation",showActionBtn: false,),
                    SizedBox(width: CustomSizes.spaceBetweenItems.w,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            const CustomProductTitleText(title: "Price : ",smallSize: true,),
                            SizedBox(width: CustomSizes.spaceBetweenItems.w,),

                            /// Actual price
                            if(controller.selectedVariation.value.salePrice>0)
                            Text("\$${controller.selectedVariation.value.price}",style: Theme.of(context).textTheme.titleSmall!.copyWith(decoration: TextDecoration.lineThrough),),
                            SizedBox(width: CustomSizes.spaceBetweenItems.w,),

                            /// Sale price
                             ProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),

                        //Stock
                        Row(children: [
                          const CustomProductTitleText(title: "Stock : ",smallSize: true,),
                          Text(controller.variationStockStatus.value,style: Theme.of(context).textTheme.titleMedium,)

                        ],)
                      ],
                    )


                  ],
                ),

                //Variation description
                 CustomProductTitleText(title: controller.selectedVariation.value.description??"")

                //variation description
              ],
            ) ,
          ),
          SizedBox(height: CustomSizes.spaceBetweenItems.h,),

          /// -- Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute)=> Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                 CustomSectionHeading(headTitle:attribute.name??"",showActionBtn: false,),
                SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
                Obx(()=>
                   Wrap(
                    spacing: 8,
                    children: attribute.values!
                        .map((attributeValue) {
                          final isSelected=controller.selectedAttributes[attribute.name]==attributeValue;
                          final available= controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);
                      return CustomChoiceChip(text: attributeValue,
                        selected: isSelected,
                        onSelected:available ?(selected){
                        if (selected &&available) {
                          controller.onAttributeSelected(product, attribute.name??"", attributeValue);
                        }
                        }: null);
                    }).toList()),
                )
              ],
            )).toList(),
          )


        ],


      ),
    );
  }
}
