import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:ecommerce_app/routs/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/enums.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:  CustomBottomAddToCart(product:product),
      body: SingleChildScrollView(
        child:Column(
          children: [
            ///--  Product Image Slider
             CustomProductImageSlider(product:product ,),

            ///-- Product Details
            Padding(padding: EdgeInsets.only(
              right: CustomSizes.defaultSpace.w,
              left: CustomSizes.defaultSpace.w,
              bottom: CustomSizes.defaultSpace.h,),
            child:  Column(
              children: [
                //rating & share button
                const RatingAndShare(),


                ///-- Price, Title, Stock, Bank
                 CustomProductMetaData(product: product,),
                ///-- Attributes
                if(product.productType==ProductType.variable.toString()) CustomProductAttributes(product: product,),
                if(product.productType==ProductType.variable.toString())SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                ///-- Checkout Button
                SizedBox(
                    width:double.infinity.w,
                    child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),

                SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                ///-- Description
                const CustomSectionHeading(headTitle: "Description",showActionButton: false,),
                SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
                ReadMoreText(
                  product.description??"",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Show more",
                  trimExpandedText: "Less",
                  moreStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w800),
                    ),
                /// reviews
                const Divider(),
                SizedBox(height: CustomSizes.spaceBetweenItems.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSectionHeading(headTitle: "Reviews(199)",showActionButton: false,onPressed: (){},),
                    IconButton(onPressed: (){
                      Navigator.of(context).pushNamed(PagesNames.productReviewsScreen);
                    }, icon: const Icon(Iconsax.arrow_right_3)),
                  ],
                ),







              ],


            ),)

          ],
        ),
      ),
    );
  }
}

