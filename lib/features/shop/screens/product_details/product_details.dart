import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:ecommerce_app/utils/constants/pages_names.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/custom_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {final isDarkMode=CustomHelpers.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: const CustomBottomAddToCart(),
      body: SingleChildScrollView(
        child:Column(
          children: [
            // product image slider

            const ProductImageSlider(),

            //Product details
            Padding(padding: EdgeInsets.only(
              right: CustomSizes.defaultSpace.w,
              left: CustomSizes.defaultSpace.w,
              bottom: CustomSizes.defaultSpace.h,),
            child:  Column(
              children: [
                //rating & share button
                const RatingAndShare(),


                /// price,title,stock,bank
                const ProductMetaData(),
                /// attributes
                const ProductAttributes(),
                SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                /// checkout button
                SizedBox(
                    width:double.infinity.w,
                    child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),

                SizedBox(height: CustomSizes.spaceBetweenSections.h,),
                /// description
                const CustomSectionHeading(headTitle: "Description",showActionBtn: false,),
                SizedBox(height: CustomSizes.spaceBetweenItems.h/2,),
                ReadMoreText("This is a product  description for a green Nike shoes ,its a trainers with high quality fabric and sole u can choose the color and size u want ,try your best and wish u a happy shopping experience  ",
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
                    CustomSectionHeading(headTitle: "Reviews(199)",showActionBtn: false,onPressed: (){},),
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

