
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/productCart/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';
import 'brand_show_case.dart';

class CustomCategoryTab extends StatelessWidget {
  const CustomCategoryTab({
    super.key, required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            //--Brands
            const BrandShowCase(images:
            [CustomImageStrings.productImage1,
              CustomImageStrings.productImage2,
              CustomImageStrings.productImage3],),

            const BrandShowCase(images:
            [CustomImageStrings.productImage1,
              CustomImageStrings.productImage2,
              CustomImageStrings.productImage3],),

            SizedBox(height: CustomSizes.spaceBetweenItems.h,),


            //Products
            CustomSectionHeading(headTitle: CustomTexts.youMightLike,onPressed: (){},),
            SizedBox(height: CustomSizes.spaceBetweenItems.h,),

            CustomGridLayout(itemCount: 4, itemBuilder: (context,index){
              return const ProductCardVertical();
            }),

          ],
        ),),]
    );
  }
}
